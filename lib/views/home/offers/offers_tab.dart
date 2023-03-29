import 'package:bq_admin/components/common/loading_indicator.dart';
import 'package:bq_admin/components/items.dart/appointment_item.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersTab extends StatefulWidget {
  const OffersTab({Key? key, required this.type}) : super(key: key);
  final int type; //1 pending //2 completed // 3 cancelled
  @override
  State<OffersTab> createState() => _OffersTab();
}

class _OffersTab extends State<OffersTab> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppoinmentController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetX<AppoinmentController>(builder: (controller) {
        return SafeArea(
            child: controller.loading.value == false &&
                    //         (widget.type == 0
                    //             ? controller.appoinments.isEmpty
                    //             : controller.appoinments
                    //                 .where((element) => element.status == widget.type)
                    //                 .isEmpty)
                    true
                ? Center(
                    child: Text(
                    "No Offers Available".tr,
                    style: TextStyle(
                        fontFamily: "primary",
                        fontSize: screenWidth(context) * 0.04),
                  ))
                : controller.loading.value == true &&
                        (widget.type == 0
                            ? controller.appoinments.isEmpty
                            : controller.appoinments
                                .where(
                                    (element) => element.status == widget.type)
                                .isEmpty)
                    ? const Center(child: LoadingIndicatore())
                    : ListView.builder(
                        itemCount: widget.type == 0
                            ? controller.appoinments.length
                            : controller.appoinments
                                .where(
                                    (element) => element.status == widget.type)
                                .length,
                        itemBuilder: (context, index) {
                          return AppointmentItem(
                            height: height,
                            width: width,
                            item: widget.type == 0
                                ? controller.appoinments[index]
                                : controller.appoinments
                                    .where((element) =>
                                        element.status == widget.type)
                                    .toList()[index],
                          );
                        },
                      ));
      }),
    );
  }
}
