import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/simple_button.dart';
import 'package:bq_admin/components/common/toasts.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/appointment_controller.dart';
import 'package:bq_admin/controllers/helper_controller.dart';
import 'package:bq_admin/models/simple/appointment.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    Key? key,
    required this.height,
    required this.item,
    required this.width,
  }) : super(key: key);

  final double height;
  final Appointment item;

  final double width;

  @override
  Widget build(BuildContext context) {
    HelperController helperController = Get.put(HelperController());
    return GetX<AppoinmentController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                // shadow direction: bottom right
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Appointment#:".tr,
                      style: TextStyle(
                          fontFamily: "primary",
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      item.id.toString(),
                      style: TextStyle(
                          fontFamily: "primary",
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const DottedLine(
                  dashColor: bgColor,
                  dashGapColor: bgColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                textRow(
                    title1: "Booking By".tr,
                    title2: "Vat Excluded".tr,
                    textColor1: Colors.grey,
                    textColor2: Colors.grey),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: width * 0.85,
                //       child: Text(
                //         "Booking By".tr,
                //         style: TextStyle(
                //             fontFamily: "primary",
                //             color: Colors.grey,
                //             fontSize: width * 0.035,
                //             fontWeight: FontWeight.w600),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.85,
                      child: Text(
                        item.byAdmin == 1 ? "Self Appointment" : "Customer ",
                        style: TextStyle(
                            fontFamily: "primary",
                            color: Colors.black,
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                textRow(
                    title1: "Date".tr,
                    title2: "Status".tr,
                    textColor1: Colors.grey,
                    textColor2: Colors.grey),
                textRow(
                  title1: item.appointmentDateTime,
                  title2: helperController.getStatusMessage(item.status),
                  textColor1: Colors.black,
                  textColor2: helperController.getStatusColor(item.status),
                ),
                const SizedBox(
                  height: 5,
                ),
                textRow(
                    title1: "TotalServices".tr,
                    title2: "TotalAmount".tr,
                    textColor1: Colors.grey,
                    textColor2: Colors.grey),
                textRow(
                    title1: item.requestedServices.length.toString(),
                    isTotalAmount: true,
                    title2: item.priceAfterDiscount.toStringAsFixed(3),
                    title3: item.totalAmount.toStringAsFixed(3),
                    textColor1: Colors.black,
                    textColor2: primaryColor),
                const SizedBox(
                  height: 5,
                ),
                textRow(
                    title1: "Employees".tr,
                    title2: Get.locale.toString() == "en"
                        ? item.employee.nameEn
                        : item.employee.nameAr,
                    textColor1: Colors.grey,
                    textColor2: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                const DottedLine(
                  dashColor: bgColor,
                  dashGapColor: bgColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    for (int i = 0; i < item.requestedServices.length; i++)
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.5,
                            child: Text(
                              "${(i + 1).toString()}- ${Get.locale.toString() == "en" ? item.requestedServices[i].providerService!.generalService.nameEn : item.requestedServices[i].providerService!.generalService.nameAr} x ${Get.locale.toString() == "en" ? " 1 " : " ١ "} ",
                              style: TextStyle(
                                  fontFamily: "primary",
                                  color: Colors.grey,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "1 x  ",
                            textDirection: Get.locale.toString() == "en"
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                            style: TextStyle(
                                fontFamily: "primary",
                                color: Colors.grey,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600),
                          ),
                          if ((double.tryParse(item.requestedServices[i].price
                                      .toString()) ??
                                  0) >
                              (double.tryParse(item
                                      .requestedServices[i].priceAfterDiscount
                                      .toString()) ??
                                  0))
                            Text(
                              "${item.requestedServices[i].price.toString()} OMR",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                fontFamily: "primary",
                              ),
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              " ${item.requestedServices[i].providerService!.chargesAfterDiscount.toString()}  OMR",
                              textDirection: Get.locale.toString() == "en"
                                  ? TextDirection.ltr
                                  : TextDirection.rtl,
                              style: TextStyle(
                                  fontFamily: "primary",
                                  color: Colors.grey,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (controller.loading.value &&
                    controller.currentUpdatingIndex.value == item.id)
                  const BQLoaing(
                    height: 25,
                    width: 25,
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (item.status == 1)
                        SizedBox(
                          width: screenWidth(context) * 0.4,
                          child: SimpleButton(
                              title: "Accept",
                              backgroundColor: Colors.green,
                              onPress: () async {
                                var result =
                                    await controller.changeAppointmentStatus(
                                        status: 2, appointmentID: item.id);
                                if (result == true) {
                                  ToastMessages.showSuccess(
                                      "Request has been accepted successfully.");
                                } else {
                                  ToastMessages.showError(
                                      "Something went wrong. Please try again.");
                                }
                              }),
                        ),
                      if (item.status == 1 || item.status == 2)
                        SizedBox(
                          width: screenWidth(context) * 0.4,
                          child: SimpleButton(
                              title: "Reject",
                              backgroundColor: Colors.red,
                              onPress: () async {
                                var result =
                                    await controller.changeAppointmentStatus(
                                        status: 4, appointmentID: item.id);
                                if (result == true) {
                                  ToastMessages.showSuccess(
                                      "Request has been rejected successfully.");
                                } else {
                                  ToastMessages.showError(
                                      "Something went wrong. Please try again.");
                                }
                              }),
                        ),
                      if (item.status == 2)
                        SizedBox(
                          width: screenWidth(context) * 0.4,
                          child: SimpleButton(
                              title: "Complete",
                              backgroundColor: Colors.green,
                              onPress: () async {
                                var result =
                                    await controller.changeAppointmentStatus(
                                        status: 3, appointmentID: item.id);
                                if (result == true) {
                                  ToastMessages.showSuccess(
                                      "Request has been completed successfully.");
                                } else {
                                  ToastMessages.showError(
                                      "Something went wrong. Please try again.");
                                }
                              }),
                        ),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }

  Row textRow(
      {required String title1,
      required String title2,
      String title3 = "",
      bool isTotalAmount = false,
      required Color textColor1,
      required Color textColor2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.5,
          child: Text(
            title1,
            style: TextStyle(
                fontFamily: "primary",
                color: textColor1,
                fontSize: width * 0.035,
                fontWeight: FontWeight.w600),
          ),
        ),
        if (isTotalAmount)
          if ((double.tryParse(title2) ?? 0) < (double.tryParse(title3) ?? 0))
            Text(
              "$title3 OMR",
              style: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w600,
                fontFamily: "primary",
              ),
            ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            title2,
            style: TextStyle(
                fontFamily: "primary",
                fontSize: width * 0.035,
                color: textColor2,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
