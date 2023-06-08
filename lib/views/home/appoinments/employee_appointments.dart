import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/loading_indicator.dart';
import 'package:bq_admin/components/items.dart/appointment_item.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/appointment_controller.dart';
import 'package:bq_admin/models/simple/appointment.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
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
                      child: DateTimePicker(
                        initialValue: controller.from.value,
                        type: DateTimePickerType.date,
                        icon: const Icon(Icons.calendar_month),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'From'.tr,
                        onChanged: (val) {
                          if (mounted) {
                            setState(() {
                              from = val;
                            });
                          }
                          fetchData();
                        },
                        validator: (val) {
                          return null;
                        },
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
                        onChanged: (val) {
                          if (mounted) {
                            setState(() {
                              to = val;
                            });
                          }
                          fetchData();
                        },
                        validator: (val) {
                          return null;
                        },
                      ),
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
