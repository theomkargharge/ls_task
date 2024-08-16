import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifespak_task/core/commons/widgets/common_btn.dart';
import 'package:lifespak_task/core/commons/widgets/common_text_style.dart';
import 'package:lifespak_task/core/constants/colors_constant.dart';
import 'package:lifespak_task/presentation/otpscreen/controller/otpcontroller.dart';
import 'package:pinput/pinput.dart';

class OTPVerify extends StatelessWidget {
  const OTPVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OTPScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: CommonText(
            text: 'OTP VERIFICATION',
            color: whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: CommonText(
                    text: "Enter Verification Code here",
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Pinput(
                onCompleted: (val)=> controller.verifyOTP(
                  verificationId: controller.arguments.value,
                  smsCode: controller.otpController.text,
                ),
                length: 6,
                controller: controller.otpController,
                enabled: true,
                focusedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: secondaryColor),
                  ),
                ),
                // Style for submitted fields
                submittedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: whiteColor,
                  ),
                ),
                // Adding a cursor
                showCursor: true,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 24,
                      width: 2,
                      color: primaryColor,
                    ),
                  ],
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Align(
                alignment: Alignment.center,
                child: CommonButton(
                  text: "Verify",
                  onPressed: () => controller.verifyOTP(
                    verificationId: controller.arguments.value,
                    smsCode: controller.otpController.text,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
