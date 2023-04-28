import 'dart:developer';

import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/appointment_controller.dart';
import 'package:bq_admin/views/home/appoinments/appointment_tab.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
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
                return Row(
                  children: [
                    SizedBox(
                      width: screenWidth(context) * 0.45,
                      child: DateTimePicker(
                        initialValue: controller.from.value,
                        type: DateTimePickerType.date,
                        icon: const Icon(Icons.calendar_month),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'From'.tr,
                        onChanged: (val) => setState(() {
                          // dateTime = val;
                          controller.from(val);
                          controller.forceLoading(true);

                          controller.fetchAppoinments();
                          // inspect({controller.from.value: controller.to.value});
                        }),
                        validator: (val) {
                          return null;
                        },
                        onSaved: (val) => setState(() {
                          // dateTime = val ?? "";
                        }),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: screenWidth(context) * 0.45,
                      child: DateTimePicker(
                        initialValue: controller.to.value,
                        type: DateTimePickerType.date,
                        icon: const Icon(Icons.calendar_month),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'To'.tr,
                        onChanged: (val) => setState(() {
                          controller.to(val);
                          // dateTime = val;
                          controller.forceLoading(true);

                          controller.fetchAppoinments();
                        }),
                        validator: (val) {
                          return null;
                        },
                        onSaved: (val) => setState(() {
                          // dateTime = val ?? "";
                        }),
                      ),
                    ),
                  ],
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
