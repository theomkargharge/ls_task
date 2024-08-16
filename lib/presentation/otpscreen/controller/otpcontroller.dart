import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifespak_task/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreenController extends GetxController {
  var otpController = TextEditingController();
  var arguments = "".obs;
  @override
  void onReady() {
    arguments.value = Get.arguments;
    log("Hii-${arguments.value}");
    update();
    super.onReady();
  }

  var isLoading = false.obs;
  verifyOTP({verificationId, smsCode}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    isLoading.value = true;
    update();
    // Create a PhoneAuthCredential with the verificationId and smsCode
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      // Sign in with the credential
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      Get.offAllNamed(AppRoutes.homeScreen);
      // Store login status and email in local storage
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLogin", true);
      if (kDebugMode) {
        print("Successfully signed in UID: ${userCredential.user?.uid}");
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      update();
      // Handle error cases
      print("Failed to sign in: ${e.message}");
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
