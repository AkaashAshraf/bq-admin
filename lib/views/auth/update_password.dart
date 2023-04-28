import 'dart:io';

import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/buttons.dart';
import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/textInputs/text_input.dart';
import 'package:bq_admin/components/common/toasts.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key, required this.forceUpdate}) : super(key: key);
  final bool forceUpdate;
  @override
  State<UpdatePassword> createState() => _UpdatePassword();
}

class _UpdatePassword extends State<UpdatePassword> {
  AuthController authController = Get.find<AuthController>();
  bool isValidate = false;

  String password = "";
  String confirmPassword = "";

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => !widget.forceUpdate,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: appBar(title: "Update Password".tr, showCart: false),
        body: SafeArea(
          child: Container(
            height: height,
            color: Colors.white,
            child: GetX<AuthController>(builder: (controller) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        textInputCustom(
                            label: "Password",
                            initialValue: password,
                            obscureText: true,
                            preIcon: const Icon(
                              Icons.password,
                              size: 20,
                              color: textInputIconColor,
                            ),
                            onTextChange: (val) {
                              setState(() {
                                password = val;
                              });
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        textInputCustom(
                            label: "Confirm Password",
                            initialValue: confirmPassword,
                            obscureText: true,
                            preIcon: const Icon(
                              Icons.password,
                              size: 20,
                              color: textInputIconColor,
                            ),
                            onTextChange: (val) {
                              setState(() {
                                confirmPassword = val;
                              });
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 10),
                        controller.loading.value
                            ? const BQLoaing(
                                height: 25,
                                width: 25,
                              )
                            : iconButton(
                                onClick: () {
                                  setState(() {
                                    isValidate = true;
                                  });
                                  if (password.isNotEmpty &&
                                      password != confirmPassword) {
                                    ToastMessages.showError(
                                        "Password mismatch");
                                    return;
                                  }
                                  if (password.isEmpty) {
                                    ToastMessages.showError(
                                        "Please enter password");
                                    return;
                                  }
                                  var res = controller.updateProfile(
                                      nameEn: "",
                                      nameAr: "",
                                      password: password,
                                      email: "",
                                      contact: "");
                                  if (res) {
                                    ToastMessages.showSuccess(
                                        "Password Updated");
                                    Get.back();
                                  }
                                  // Navigator.pop(context);
                                },
                                text: "Update".tr,
                              ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget imageViewer(XFile image, dynamic onTap) {
    return SizedBox(
        height: 150,
        width: 90,
        child: Row(
          children: [
            SizedBox(
              height: 150,
              width: 25,
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Image.asset(
                    'assets/images/cross.png',
                    height: 17,
                    width: 17,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Image.file(
                File(image.path),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }
}
