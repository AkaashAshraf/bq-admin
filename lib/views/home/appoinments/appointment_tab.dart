import 'package:bq_admin/components/common/loading_indicator.dart';
import 'package:bq_admin/components/items.dart/appointment_item.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({Key? key, required this.type}) : super(key: key);
  final int type; //1 pending //2 completed // 3 cancelled
  @override
  State<AppointmentTab> createState() => _AppointmentTab();
}

class _AppointmentTab extends State<AppointmentTab> {
  AppoinmentController appoinmentController = Get.find<AppoinmentController>();

  @override
  void initState() {
    appoinmentController.fetchAppoinments();
    super.initState();
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetX<AppoinmentController>(builder: (controller) {
        return SafeArea(
            child: controller.forceLoading.value
                ? const Center(child: LoadingIndicatore())
                : controller.loading.value == false &&
                        (widget.type == 0
                            ? controller.appoinments.isEmpty
                            : controller.appoinments
                                .where((element) => widget.type == 5
                                    ? element.byAdmin == 1
                                    : element.status == widget.type)
                                .isEmpty)
                    ? Center(
                        child: Text(
                        "NoAppointmentsAvailable".tr,
                        style: TextStyle(
                            fontFamily: "primary",
                            fontSize: screenWidth(context) * 0.04),
                      ))
                    : controller.loading.value == true &&
                            (widget.type == 0
                                ? controller.appoinments.isEmpty
                                : controller.appoinments
                                    .where((element) => widget.type == 5
                                        ? element.byAdmin == 1
                                        : element.status == widget.type)
                                    .isEmpty)
                        ? const Center(child: LoadingIndicatore())
                        : SmartRefresher(
                            controller: refreshController,
                            enablePullDown: true,
                            enablePullUp: false,
                            onRefresh: () async {
                              await controller.fetchAppoinments();

                              refreshController.refreshCompleted();
                            },
                            header: const WaterDropHeader(),
                            child: ListView.builder(
                              itemCount: widget.type == 0
                                  ? controller.appoinments.length
                                  : controller.appoinments
                                      .where((element) => widget.type == 5
                                          ? element.byAdmin == 1
                                          : element.status == widget.type)
                                      .length,
                              itemBuilder: (context, index) {
                                return AppointmentItem(
                                  height: screenHeight(context),
                                  width: screenWidth(context),
                                  item: widget.type == 0
                                      ? controller.appoinments[index]
                                      : controller.appoinments
                                          .where((element) => widget.type == 5
                                              ? element.byAdmin == 1
                                              : element.status == widget.type)
                                          .toList()[index],
                                );
                              },
                            ),
                          ));
      }),
    );
  }
}
