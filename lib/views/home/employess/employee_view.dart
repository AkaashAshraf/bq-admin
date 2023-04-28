import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/buttons.dart';
import 'package:bq_admin/components/common/dotted_line.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/employee_controller.dart';
import 'package:bq_admin/controllers/helper_controller.dart';
import 'package:bq_admin/models/response/employee_details.dart';
import 'package:bq_admin/models/simple/employee.dart';
import 'package:bq_admin/views/home/appoinments/employee_appointments.dart';
import 'package:bq_admin/views/home/employess/add_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class EmployeeDetailsView extends StatefulWidget {
  const EmployeeDetailsView({Key? key, required this.employee})
      : super(key: key);
  final Employee employee;

  @override
  State<EmployeeDetailsView> createState() => _EmployeeDetailsView();
}

class _EmployeeDetailsView extends State<EmployeeDetailsView> {
  HelperController helperController = Get.put(HelperController());
  Stats stats = Stats();
  // var employees;
  // var services;
  // Employee? employees;
  // List<Employee> employees = [];
  bool loading = true;
  fetchEmployees() async {
    var res =
        await controller.fetchEmployeeDetails(widget.employee.empId.toString());
    // inspect(res);
    if (res != null) {
      var jsonRes = employeeDetailsFromJson(res?.body);
      setState(() {
        stats = jsonRes.stats ?? Stats();
      });
    }
  }

  @override
  void initState() {
    fetchEmployees();
    super.initState();
    getInitializeObjects();
  }

  getInitializeObjects() async {
    // controller.fetchEmployeesList(id: widget.saloon.id ?? 0);
  }

  EmployeeController controller = Get.put(EmployeeController());

  // CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Employee Details"),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: screenHeight(context) * 0.89,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: Image.network(
                            "$imageBaseUrl/${widget.employee.image}",
                            fit: BoxFit.cover,
                            height: screenHeight(context) * 0.28,
                            width: screenWidth(context),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Get.locale.toString() == "en"
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                      Get.locale.toString() == "en"
                                          ? widget.employee.nameEn
                                          : widget.employee.nameAr,
                                      textStyle: TextStyle(
                                          fontSize: screenWidth(context) * 0.05,
                                          fontFamily: "primary",
                                          fontWeight: FontWeight.w600,
                                          color: titleColor),
                                      colors: [primaryColor, secandaryColor],
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Country",
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "primary",
                                        color: secondaryTextColor),
                                  ),
                                  Text(
                                    Get.locale.toString() == "en"
                                        ? widget.employee.countryEn
                                        : widget.employee.countryAr,
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "primary",
                                        color: secondaryTextColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Holidays",
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "primary",
                                        color: secondaryTextColor),
                                  ),
                                  Text(
                                    helperController.getHolidaysName(
                                        widget.employee.holiday1,
                                        widget.employee.holiday2),
                                    textAlign: Get.locale.toString() == "en"
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "primary",
                                        color: secondaryTextColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: screenWidth(context) * 0.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Total Appoinments:",
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontFamily: "primary",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        stats.totalAppoinments.toString(),
                                        style: const TextStyle(
                                          color: secondaryTextColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "primary",
                                        ),
                                      ),
                                      // DefaultTextStyle(
                                      //   style: TextStyle(
                                      //       // fontSize: 15.0,

                                      //       fontWeight: FontWeight.bold,
                                      //       color: primaryColor),
                                      //   child: AnimatedTextKit(
                                      //     repeatForever: true,
                                      //     animatedTexts: [
                                      //       FadeAnimatedText('Opened'),
                                      //     ],
                                      //     onTap: () {
                                      //       print("Tap Event");
                                      //     },
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: screenWidth(context) * 0.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Total Earning:",
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontFamily: "primary",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        stats.totalEarning.toStringAsFixed(3),
                                        style: const TextStyle(
                                          color: secondaryTextColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "primary",
                                        ),
                                      ),
                                      // DefaultTextStyle(
                                      //   style: TextStyle(
                                      //       // fontSize: 15.0,

                                      //       fontWeight: FontWeight.bold,
                                      //       color: primaryColor),
                                      //   child: AnimatedTextKit(
                                      //     repeatForever: true,
                                      //     animatedTexts: [
                                      //       FadeAnimatedText('Opened'),
                                      //     ],
                                      //     onTap: () {
                                      //       print("Tap Event");
                                      //     },
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              rattingRow(
                                  context, stats.starRatters5.toString(), 5),
                              const SizedBox(height: 5),
                              rattingRow(
                                  context, stats.starRatters4.toString(), 4),
                              const SizedBox(height: 5),
                              rattingRow(
                                  context, stats.starRatters3.toString(), 3),
                              const SizedBox(height: 5),
                              rattingRow(
                                  context, stats.starRatters2.toString(), 2),
                              const SizedBox(height: 5),
                              rattingRow(
                                  context, stats.starRatters1.toString(), 1),
                              const SizedBox(height: 10),
                              dottedLine(thicknes: 1),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "Avg Ratting",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "primary",
                                        fontSize: screenWidth(context) * 0.04),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              rattingRow(
                                  context,
                                  "${(stats.totalStarRatting / stats.totalStarRatters).toStringAsFixed(1)} / ${stats.totalStarRatters}",
                                  (stats.totalStarRatting /
                                      stats.totalStarRatters)),
                              const SizedBox(height: 10),
                              dottedLine(thicknes: 1),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context) * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: screenWidth(context) * 0.43,
                                child: iconButton(
                                    onClick: () async {
                                      Get.to(EmployeeAppointments(
                                          empID: widget.employee.empId));
                                    },
                                    icon: const Icon(
                                      Icons.book,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    text: "Appointments".tr),
                              ),
                              SizedBox(
                                width: screenWidth(context) * 0.43,
                                child: iconButton(
                                    onClick: () async {
                                      // fetchEmployees();
                                      Get.to(AddEmployee(
                                          employee: widget.employee));
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    text: "Edit".tr),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        dottedLine(thicknes: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget rattingRow(BuildContext context, String text, double rating) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: screenWidth(context) * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: RatingBar.builder(
                initialRating: rating,
                ignoreGestures: true,
                itemSize: 20,
                minRating: 1,

                // unratedColor: secandaryColor,
                direction: Axis.horizontal,
                allowHalfRating: true,
                // tapOnlyMode: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "primary",
                  fontSize: screenWidth(context) * 0.04),
            ),
          ],
        ),
      ),
    );
  }
}
