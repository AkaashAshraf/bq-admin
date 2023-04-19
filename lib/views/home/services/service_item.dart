import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/simple_button.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/service_controller.dart';
import 'package:bq_admin/models/simple/service.dart';
import 'package:bq_admin/views/home/services/update_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget serviceItem(double cardHeight, BuildContext context,
    {required Service item, required dynamic onPress}) {
  return GestureDetector(
    onTap: () {
      onPress(item);
    },
    child: SizedBox(child: GetX<ServiceController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Card(
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  "$imageBaseUrl${item.image}",
                  fit: BoxFit.fill,
                  height: screenWidth(context) * 0.27,
                  width: screenWidth(context) * 0.23,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: screenWidth(context) * 0.65,
                      child: Text(
                        Get.locale.toString() == "en"
                            ? item.generalService.nameEn
                            : item.generalService.nameAr,
                        textAlign: Get.locale.toString() == "en"
                            ? TextAlign.left
                            : TextAlign.right,
                        style: TextStyle(
                            fontFamily: "primary",
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: getTextSize(context).smallItemMainText),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: screenWidth(context) * 0.65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Charges",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
                          ),
                          Text(
                            "${item.charges} OMR",
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "primary",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: screenWidth(context) * 0.65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Estimated Time",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
                          ),
                          Text(
                            "${item.time} Min",
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "primary",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: screenWidth(context) * 0.65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Status",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontFamily: "primary",
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              item.isBlocked == 1
                                  ? "Blocked"
                                  : item.isActive == 0
                                      ? "Deactive"
                                      : "Active",
                              style: TextStyle(
                                color: item.isBlocked == 1
                                    ? Colors.red
                                    : item.isActive == 0
                                        ? Colors.red
                                        : Colors.green,
                                fontFamily: "primary",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth(context) * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SimpleButton(
                              backgroundColor: Colors.green,
                              title: "Update",
                              onPress: () {
                                Get.to(UpdateService(service: item));
                                // controller.blockUnblockSerivce(
                                //     status: item.isActive == 0 ? 1 : 0,
                                //     serviceId: item.id);
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          controller.updateStatusLoading.value &&
                                  controller.updateStatusID.value == item.id
                              ? const BQLoaing(height: 25, width: 25)
                              : SimpleButton(
                                  backgroundColor: item.isActive == 0
                                      ? Colors.green
                                      : Colors.red,
                                  title: item.isActive == 0
                                      ? "Active Now"
                                      : "Deativate ",
                                  onPress: () {
                                    controller.blockUnblockSerivce(
                                        status: item.isActive == 0 ? 1 : 0,
                                        serviceId: item.id);
                                  }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    })),
  );
}
