import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifespak_task/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends GetxController {
  final emailController = TextEditingController().obs;
  final mobilenoController = TextEditingController().obs;
  var emailFocus = false.obs;
  var mobileFocus = false.obs;
  RxBool loading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void getOTP({required String phoneNumber, required String emailId}) async {
    // Navigate to the OTP screen
    loading.value = true;
    update();
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Automatically handles the verification and signs in the user.
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Error", "Please enter a valid mobile number",
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar("Error", e.message ?? "Something went wrong",
              snackPosition: SnackPosition.BOTTOM);
        }
        loading.value = false;
        update();
      },
      codeSent: (String verificationId, int? resendToken) {
        Future.delayed(const Duration(seconds: 2), () async {
          Get.toNamed(AppRoutes.otpScreen, arguments: verificationId);

          // Store login status and email in local storage
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("emailId", emailId);
          loading.value = false;
          update();
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout if necessary
      },
    );
  }
}
