import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/buttons.dart';
import 'package:bq_admin/components/common/labels/auth_top_label.dart';
import 'package:bq_admin/components/common/loading_indicator.dart';
import 'package:bq_admin/components/common/logo_image.dart';
import 'package:bq_admin/components/common/textInputs/password_input.dart';
import 'package:bq_admin/components/common/textInputs/text_input.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: noAppBar(showCart: false),
        body: SafeArea(
          child: GetX<AuthController>(builder: (controller) {
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primaryColor,
                  secandaryColor,
                  primaryColor,
                  secandaryColor,
                ],
              )),
              height: height,
              width: width,
              child: Column(
                children: [
                  Expanded(child: LogoImage(height: height)),
                  // const Text("Dalilee Shiper "),
                  Animate(
                    effects: const [
                      // FadeEffect(delay: Duration(milliseconds: 800)),
                      // MoveEffect()
                      MoveEffect(
                          begin: Offset(0, 600),
                          curve: Curves.easeInOut,
                          delay: Duration(milliseconds: 000),
                          duration: Duration(milliseconds: 600)),
                    ],
                    child: SingleChildScrollView(
                      child: Container(
                        height: height * 0.63,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    textInputCustom(
                                        label: "EnterMobileNo".tr,
                                        initialValue:
                                            controller.contact.toString(),
                                        preIcon: const Icon(
                                          Icons.numbers,
                                          size: 20,
                                          color: textInputIconColor,
                                        ),
                                        maxLength: 8,
                                        onTextChange: (val) {
                                          controller.contact.value = val;
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    PasswordInput(
                                      lable: "EnterPassword".tr,
                                      onTextChange: (val) {
                                        controller.password.value = val;
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Get.to(const ForgetPassword(title: ""));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            width: width,
                                            child: Text(
                                              "ForgetPassword".tr,
                                              textAlign:
                                                  Get.locale.toString() == "en"
                                                      ? TextAlign.right
                                                      : TextAlign.left,
                                              style: const TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.italic),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    controller.loading.value
                                        ? const LoadingIndicatore()
                                        : iconButton(
                                            onClick: () {
                                              controller.login();
                                            },
                                            text: "Login".tr,
                                          ),
                                    const SizedBox(
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              AuthTopText(width: width, title: "Login".tr)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //     top: 0,
                  //     left: 0,
                  //     right: 0,
                  //     child: Animate(
                  //       effects: const [
                  //         // FadeEffect(delay: Duration(milliseconds: 800)),
                  //         // MoveEffect()
                  //         MoveEffect(
                  //             begin: Offset(0, -200),
                  //             curve: Curves.easeInOut,
                  //             delay: Duration(milliseconds: 000),
                  //             duration: Duration(milliseconds: 600)),
                  //       ],
                  //       child: Container(
                  //         height: 100,
                  //         width: 100,
                  //         child: Image.asset('assets/images/logo.jpeg',
                  //             height: 200,
                  //             scale: 2.5,
                  //             // color: Color.fromARGB(255, 15, 147, 59),
                  //             opacity: const AlwaysStoppedAnimation<double>(0.5)),
                  //       ),
                  //     ))
                ],
              ),
            );
          }),
        ));
  }
}
