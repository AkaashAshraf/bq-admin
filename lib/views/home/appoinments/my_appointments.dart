import 'dart:developer';

import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/appointment_controller.dart';
import 'package:bq_admin/views/home/appoinments/appointment_tab.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

class MyAppointmentsList extends StatefulWidget {
  const MyAppointmentsList({Key? key}) : super(key: key);
  @override
  State<MyAppointmentsList> createState() => _MyAppointmentsList();
}

class _MyAppointmentsList extends State<MyAppointmentsList> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'All'.tr),
    Tab(text: 'Pending'.tr),
    Tab(text: 'Confirmed'.tr),
    Tab(text: 'Completed'.tr),
    Tab(text: 'Cancelled'.tr),
  ];
  final List<Widget> myWidgets = <Widget>[
    const AppointmentTab(type: 0),
    const AppointmentTab(type: 1),
    const AppointmentTab(type: 2),
    const AppointmentTab(type: 3),
    const AppointmentTab(
      type: 4,
    ),
  ];
  DateTime? newDateTime;
  AppoinmentController appoinmentController = Get.put(AppoinmentController());
  @override
  void initState() {
    appoinmentController.from("");
    appoinmentController.to("");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: "Appointments", showCart: false),
      body: SafeArea(
        child: DefaultTabController(
          length: myTabs.length,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 12,
              ),
              GetX<AppoinmentController>(builder: (controller) {
                return SizedBox(
                  height: screenHeight(context) * 0.1,
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth(context) * 0.45,
                        child: GestureDetector(
                          onTap: () async {
                            newDateTime = await showRoundedDatePicker(
                                fontFamily: "primary",
                                context: context,
                                styleDatePicker: MaterialRoundedDatePickerStyle(
                                  textStyleDayOnCalendarSelected:
                                      const TextStyle(color: Colors.white),
                                  textStyleYearButton:
                                      const TextStyle(color: Colors.white),
                                ),
                                theme: ThemeData(primarySwatch: mainAppColor),
                                locale: Locale(Get.locale.toString()),
                                customWeekDays: [
                                  "sun".tr,
                                  "mon".tr,
                                  "tue".tr,
                                  "wed".tr,
                                  "thu".tr,
                                  "fri".tr,
                                  "sat".tr
                                ],
                                textPositiveButton: "ok".tr,
                                textNegativeButton: "cancel".tr,
                                okHandler: (DateTime val) {
                                  // print(val);
                                  controller.from(
                                      "${val.year}-${val.month < 10 ? "0" : ""}${val.month}-${val.day < 10 ? "0" : ""}${val.day}");
                                  controller.forceLoading(true);

                                  controller.fetchAppoinments();
                                });
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                width: screenWidth(context),
                                child: Text(
                                  "From".tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth(context) * 0.04,
                                      fontFamily: "primary"),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.punch_clock,
                                    color: Colors.grey,
                                    // size: 30.0,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: screenWidth(context) * 0.35,
                                    decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                5.0))), // height: 20,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.from.value,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "primary"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //  DateTimePicker(
                        //   initialValue: controller.from.value,
                        //   type: DateTimePickerType.date,
                        //   icon: const Icon(Icons.calendar_month),
                        //   firstDate: DateTime(2000),
                        //   lastDate: DateTime(2100),
                        //   dateLabelText: 'From'.tr,
                        //   onChanged: (val) {
                        //     if (mounted) {
                        //       setState(() {
                        //         from = val;
                        //       });
                        //     }
                        //     fetchData();
                        //   },
                        //   validator: (val) {
                        //     return null;
                        //   },
                        // ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: screenWidth(context) * 0.45,
                        child: GestureDetector(
                          onTap: () async {
                            newDateTime = await showRoundedDatePicker(
                                fontFamily: "primary",
                                context: context,
                                styleDatePicker: MaterialRoundedDatePickerStyle(
                                  textStyleDayOnCalendarSelected:
                                      const TextStyle(color: Colors.white),
                                  textStyleYearButton:
                                      const TextStyle(color: Colors.white),
                                ),
                                theme: ThemeData(primarySwatch: mainAppColor),
                                locale: Locale(Get.locale.toString()),
                                customWeekDays: [
                                  "sun".tr,
                                  "mon".tr,
                                  "tue".tr,
                                  "wed".tr,
                                  "thu".tr,
                                  "fri".tr,
                                  "sat".tr
                                ],
                                textPositiveButton: "ok".tr,
                                textNegativeButton: "cancel".tr,
                                okHandler: (DateTime val) {
                                  // print(val);

                                  controller.to(
                                      "${val.year}-${val.month < 10 ? "0" : ""}${val.month}-${val.day < 10 ? "0" : ""}${val.day}");
                                  controller.forceLoading(true);

                                  controller.fetchAppoinments();
                                });
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                width: screenWidth(context),
                                child: Text(
                                  "To".tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth(context) * 0.04,
                                      fontFamily: "primary"),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.punch_clock,
                                    color: Colors.grey,
                                    // size: 30.0,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: screenWidth(context) * 0.35,
                                    decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                5.0))), // height: 20,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.to.value,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "primary"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //  DateTimePicker(
                        //   initialValue: controller.from.value,
                        //   type: DateTimePickerType.date,
                        //   icon: const Icon(Icons.calendar_month),
                        //   firstDate: DateTime(2000),
                        //   lastDate: DateTime(2100),
                        //   dateLabelText: 'From'.tr,
                        //   onChanged: (val) {
                        //     if (mounted) {
                        //       setState(() {
                        //         from = val;
                        //       });
                        //     }
                        //     fetchData();
                        //   },
                        //   validator: (val) {
                        //     return null;
                        //   },
                        // ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                backgroundColor: topTabForground,
                unselectedBackgroundColor: topTabBackground,
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: myTabs,
              ),
              Expanded(
                child: TabBarView(children: myWidgets),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
