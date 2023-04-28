import 'dart:io';

import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/buttons.dart';
import 'package:bq_admin/components/common/image_picker.dart';
import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/textInputs/text_input.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  AuthController authController = Get.find<AuthController>();
  XFile? image1;
  String imageSelectionType = "gallery".tr;
  String nameEn = "";
  String nameAr = "";
  String contact = "";
  String email = "";
  @override
  void initState() {
    setState(() {
      nameEn = authController.userInfo.value.nameEn;
      nameAr = authController.userInfo.value.nameAr;
      contact = authController.userInfo.value.contact ?? "";
      email = authController.userInfo.value.email ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Profile".tr, showCart: false),
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
                        height: 50,
                      ),
                      textInputCustom(
                          label: "Name En",
                          initialValue: nameEn,
                          preIcon: const Icon(
                            Icons.text_decrease,
                            size: 20,
                            color: textInputIconColor,
                          ),
                          onTextChange: (val) {
                            setState(() {
                              nameEn = val;
                            });
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      textInputCustom(
                          label: "Name Ar",
                          initialValue: nameAr,
                          preIcon: const Icon(
                            Icons.text_decrease,
                            size: 20,
                            color: textInputIconColor,
                          ),
                          onTextChange: (val) {
                            setState(() {
                              nameAr = val;
                            });
                          }),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      // textInputCustom(
                      //     label: "Email".tr,
                      //     initialValue: email,
                      //     preIcon: const Icon(
                      //       Icons.email,
                      //       size: 20,
                      //       color: textInputIconColor,
                      //     ),
                      //     onTextChange: (val) {
                      //       setState(() {
                      //         email = val;
                      //       });
                      //     }),
                      const SizedBox(
                        height: 30,
                      ),
                      textInputCustom(
                          label: "MobileNo".tr,
                          initialValue: contact,
                          preIcon: const Icon(
                            Icons.numbers,
                            size: 20,
                            color: textInputIconColor,
                          ),
                          maxLength: 8,
                          onTextChange: (val) {
                            setState(() {
                              contact = val;
                            });
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      customImagePicker(
                        hint: '',
                        width: screenWidth(context),

                        onTap: () async {
                          // AlertText(context, 'txt').show();
                          var tempImage = (await ImagePicker().pickImage(
                              source: imageSelectionType == "gallery".tr
                                  ? ImageSource.gallery
                                  : ImageSource.camera));
                          // inspect(tempImage);
                          {
                            setState(() {
                              image1 = tempImage;
                            });
                          }
                        },
                        // keyBoardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          if (image1 != null)
                            imageViewer(image1!, () {
                              setState(() {
                                image1 = null;
                              });
                            })
                          else if (controller
                              .userInfo.value.imagePath.isNotEmpty)
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                imageBaseUrl +
                                    controller.userInfo.value.imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      controller.loading.value
                          ? const BQLoaing(
                              height: 25,
                              width: 25,
                            )
                          : iconButton(
                              onClick: () {
                                controller.updateProfile(
                                    nameEn: nameEn,
                                    nameAr: nameAr,
                                    password: "",
                                    email: email,
                                    contact: contact,
                                    image: image1);
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
