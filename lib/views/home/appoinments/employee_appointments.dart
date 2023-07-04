import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/loading_indicator.dart';
import 'package:bq_admin/components/items.dart/appointment_item.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/appointment_controller.dart';
import 'package:bq_admin/models/simple/appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EmployeeAppointments extends StatefulWidget {
  const EmployeeAppointments({Key? key, required this.empID}) : super(key: key);
  final int empID;

  @override
  State<EmployeeAppointments> createState() => _EmployeeAppointments();
}

class _EmployeeAppointments extends State<EmployeeAppointments> {
  AppoinmentController appoinmentController = Get.find<AppoinmentController>();
  List<Appointment> appoinments = [];
  DateTime? newDateTime;

  String to = "";
  String from = "";
  bool loading = true;
  fetchData() async {
    var res = await appoinmentController
        .fetchEmployeeAppoinments(widget.empID.toString(), to: to, from: from);
    if (mounted) {
      setState(() {
        appoinments = res;
        loading = false;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Appointments"),
      backgroundColor: Colors.white,
      body: GetX<AppoinmentController>(builder: (controller) {
        return SafeArea(
            child: SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          enablePullUp: false,
          onRefresh: () async {
            await fetchData();

            refreshController.refreshCompleted();
          },
          header: const WaterDropHeader(),
          child: Column(
            children: [
              SizedBox(
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
                                setState(() {
                                  from =
                                      "${val.year}-${val.month < 10 ? "0" : ""}${val.month}-${val.day < 10 ? "0" : ""}${val.day}";
                                });
                                fetchData();
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
                                          Radius.circular(5.0))), // height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      from,
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
                                setState(() {
                                  to =
                                      "${val.year}-${val.month < 10 ? "0" : ""}${val.month}-${val.day < 10 ? "0" : ""}${val.day}";
                                });
                                fetchData();
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
                                          Radius.circular(5.0))), // height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      to,
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
              ),
              Expanded(
                child: controller.forceLoading.value
                    ? const Center(child: LoadingIndicatore())
                    : loading == false && (appoinments.isEmpty)
                        ? Center(
                            child: Text(
                            "NoAppointmentsAvailable".tr,
                            style: TextStyle(
                                fontFamily: "primary",
                                fontSize: screenWidth(context) * 0.04),
                          ))
                        : loading == true && (appoinments.isEmpty)
                            ? const Center(child: LoadingIndicatore())
                            : ListView.builder(
                                itemCount: appoinments.length,
                                itemBuilder: (context, index) {
                                  return AppointmentItem(
                                    height: screenHeight(context),
                                    width: screenWidth(context),
                                    item: appoinments.toList()[index],
                                  );
                                },
                              ),
              ),
            ],
          ),
        ));
      }),
    );
  }
}
