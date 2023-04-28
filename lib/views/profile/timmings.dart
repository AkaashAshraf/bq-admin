import 'dart:io';

import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/buttons.dart';
import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/auth_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Timmings extends StatefulWidget {
  const Timmings({Key? key}) : super(key: key);
  @override
  State<Timmings> createState() => _Timmings();
}

class _Timmings extends State<Timmings> {
  AuthController authController = Get.find<AuthController>();

  String time1 = "";
  String time2 = "";
  String time3 = "";
  String time4 = "";
  @override
  void initState() {
    setState(() {
      time1 = authController.userInfo.value.openTime1;
      time2 = authController.userInfo.value.closeTime1;
      time3 = authController.userInfo.value.openTime2;
      time4 = authController.userInfo.value.closeTime2;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Adjust Timming".tr, showCart: false),
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
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth(context) * 0.45,
                            child: DateTimePicker(
                              initialValue: time1,
                              type: DateTimePickerType.time,
                              icon: const Icon(Icons.punch_clock),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateLabelText: 'Time 1'.tr,
                              onChanged: (val) => setState(() {
                                time1 = val;
                              }),
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => setState(() {
                                time1 = val ?? "";
                              }),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth(context) * 0.45,
                            child: DateTimePicker(
                              initialValue: time2,
                              type: DateTimePickerType.time,
                              icon: const Icon(Icons.punch_clock),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateLabelText: 'Time 2'.tr,
                              onChanged: (val) => setState(() {
                                time2 = val;
                              }),
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => setState(() {
                                time2 = val ?? "";
                              }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth(context) * 0.45,
                            child: DateTimePicker(
                              initialValue: time3,
                              type: DateTimePickerType.time,
                              icon: const Icon(Icons.punch_clock),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateLabelText: 'Time 3'.tr,
                              onChanged: (val) => setState(() {
                                time3 = val;
                              }),
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => setState(() {
                                time3 = val ?? "";
                              }),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth(context) * 0.45,
                            child: DateTimePicker(
                              initialValue: time4,
                              type: DateTimePickerType.time,
                              icon: const Icon(Icons.punch_clock),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateLabelText: 'Time 4'.tr,
                              onChanged: (val) => setState(() {
                                time4 = val;
                              }),
                              validator: (val) {
                                return null;
                              },
                              onSaved: (val) => setState(() {
                                time4 = val ?? "";
                              }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 50),
                      controller.loading.value
                          ? const BQLoaing(
                              height: 25,
                              width: 25,
                            )
                          : iconButton(
                              onClick: () {
                                controller.updateProfile(
                                    time1: time1,
                                    time2: time1,
                                    time3: time3,
                                    time4: time4,
                                    nameEn: "",
                                    nameAr: "",
                                    password: "",
                                    email: "",
                                    contact: "",
                                    image: null);
                                Navigator.pop(context);
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
