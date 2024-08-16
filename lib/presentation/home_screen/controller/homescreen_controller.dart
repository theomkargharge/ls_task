import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lifespak_task/core/constants/colors_constant.dart';
import 'package:lifespak_task/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreenController extends GetxController {
  void logout() {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signOut();
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  void getStoredEmail() {
    SharedPreferences.getInstance().then((val) {
      ;
      showToast(val.getString("emailId") ?? "");
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: textColor,
      textColor: whiteColor,
      fontSize: 16.0,
    );
  }

  @override
  void onReady() {
    super.onReady();
    getStoredEmail();
  }
}
