import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifespak_task/core/commons/widgets/common_btn.dart';
import 'package:lifespak_task/core/commons/widgets/common_text_style.dart';
import 'package:lifespak_task/core/constants/colors_constant.dart';
import 'package:lifespak_task/presentation/login_screen/controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonText(
                              text: "Welcome Back!!",
                              color: primaryColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                          CommonText(
                              text: "Verify your number... ",
                              color: textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                          const SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(() {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: controller.emailFocus.value
                                      ? [
                                          BoxShadow(
                                            color:
                                                primaryColor.withOpacity(0.3),
                                            offset: const Offset(0.0, -8.0),
                                            blurRadius: 30.0,
                                            spreadRadius: 1.0,
                                          ),
                                        ]
                                      : controller.emailController.value.text
                                              .isNotEmpty
                                          ? [
                                              BoxShadow(
                                                color: Colors.green
                                                    .withOpacity(0.1),
                                                offset: const Offset(0.0, -8.0),
                                                blurRadius: 30.0,
                                                spreadRadius: 1.0,
                                              ),
                                            ]
                                          : [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.12),
                                                offset: const Offset(1.0, -8.0),
                                                blurRadius: 2.0,
                                                spreadRadius: 1.0,
                                              ),
                                            ],
                                ),
                                child: Focus(
                                  onFocusChange: (hasFocus) {
                                    controller.emailFocus.value = hasFocus;
                                  },
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Please enter mobile number';
                                      }
                                      return null;
                                    },
                                    controller:
                                        controller.emailController.value,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Icons.email_outlined,
                                          color: primaryColor,
                                        ),
                                      ),
                                      hintText: "Email",
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(() {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: controller.mobileFocus.value
                                      ? [
                                          BoxShadow(
                                            color:
                                                primaryColor.withOpacity(0.3),
                                            offset: const Offset(0.0, -8.0),
                                            blurRadius: 30.0,
                                            spreadRadius: 1.0,
                                          ),
                                        ]
                                      : controller.mobilenoController.value.text
                                              .isNotEmpty
                                          ? [
                                              BoxShadow(
                                                color: Colors.green
                                                    .withOpacity(0.1),
                                                offset: const Offset(0.0, -8.0),
                                                blurRadius: 30.0,
                                                spreadRadius: 1.0,
                                              ),
                                            ]
                                          : [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                offset: const Offset(1.0, -8.0),
                                                blurRadius: 2.0,
                                                spreadRadius: 1.0,
                                              ),
                                            ],
                                ),
                                child: Focus(
                                  onFocusChange: (hasFocus) {
                                    controller.mobileFocus.value = hasFocus;
                                  },
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Please enter mobile number';
                                      }
                                      return null;
                                    },
                                    controller:
                                        controller.mobilenoController.value,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.phone,
                                            color: primaryColor,
                                          ),
                                        ),
                                        hintText: "Mobile No",
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 40),
                          Obx(
                            () => controller.loading.value
                                ? CircularProgressIndicator(
                                    backgroundColor: primaryColor,
                                    color: Colors.white,
                                  )
                                : Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 200,
                                      child: CommonButton(
                                        text: "Get OTP",
                                        onPressed: () {
                                          if (!controller.formKey.currentState!
                                              .validate()) {
                                          } else {
                                            controller.getOTP(
                                                phoneNumber: controller
                                                    .mobilenoController
                                                    .value
                                                    .text,
                                                emailId: controller
                                                    .emailController
                                                    .value
                                                    .text);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   child: Container(
            //     height: 130,
            //     width: 120,
            //     decoration: BoxDecoration(
            //       color: secondaryColor,
            //       borderRadius: const BorderRadius.all(Radius.circular(60)),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 20,
            //   right: 20,
            //   child: Container(
            //     height: 130,
            //     width: 120,
            //     decoration: BoxDecoration(
            //       color: primaryColor,
            //       borderRadius: const BorderRadius.all(Radius.circular(55)),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 40,
            //   right: 40,
            //   child: Container(
            //     height: 130,
            //     width: 120,
            //     decoration: BoxDecoration(
            //       color: optionColor,
            //       borderRadius: const BorderRadius.all(Radius.circular(40)),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
