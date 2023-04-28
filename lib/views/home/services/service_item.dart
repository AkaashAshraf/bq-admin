import 'package:bq_admin/components/common/buttons.dart';
import 'package:bq_admin/components/common/generic_popup.dart';
import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/simple_button.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/cart_controller.dart';
import 'package:bq_admin/controllers/service_controller.dart';
import 'package:bq_admin/models/simple/cart.dart';
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth(context) * 0.55,
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
                                fontSize:
                                    getTextSize(context).smallItemMainText),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.find<CartController>().addToCart(
                              CartItem(
                                  imagePath: item.image,
                                  productID: item.id,
                                  providerID: item.companyId,
                                  nameEn: item.generalService.nameEn,
                                  time: int.tryParse(item.time) ?? 0,
                                  nameAr: item.generalService.nameAr,
                                  unitPrice: double.tryParse(
                                          item.chargesAfterDiscount) ??
                                      0),
                            );
                          },
                          child: const Icon(
                            Icons.shopping_cart,
                            size: 22,
                            color: primaryColor,
                          ),
                        ),
                      ],
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
                          Row(
                            children: [
                              if ((double.tryParse(item.charges) ?? 0) >
                                  (double.tryParse(item.chargesAfterDiscount) ??
                                      0))
                                Text(
                                  "${item.charges} OMR",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.lineThrough,
                                    fontFamily: "primary",
                                  ),
                                ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${item.chargesAfterDiscount} OMR",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "primary",
                                ),
                              ),
                            ],
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
              if (false)
                Positioned(
                  bottom: 5,
                  right: Get.locale.toString() == "en"
                      ? 10
                      : screenWidth(context) * 0.85,
                  child: GetX<CartController>(builder: (cartController) {
                    return GestureDetector(
                      onTap: () async {
                        // cartController.addToCart(
                        //     CartItem(
                        //         imagePath: service.image ?? "",
                        //         productID: service.id ?? 0,
                        //         providerID: service.companyId ?? 0,
                        //         nameEn: service.generalService?.nameEn ?? "",
                        //         time: service.time ?? 0,
                        //         nameAr: service.generalService?.nameAr ?? "",
                        //         unitPrice: double.tryParse(service.charges!) ?? 0),
                        //     saloon);

                        // var contain = Get.put(SaloonsController())
                        //     .services
                        //     .where((element) =>
                        //         element.serviceAssigneeId ==
                        //         service.serviceAssigneeId)
                        //     .first
                        //     .isAddedToCart = isAdded;

                        // Get.put(
                        //     SaloonsController().services.first.isAddedToCart);
                      },
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 22,
                        color: primaryColor,
                      ),
                    );
                  }),
                ),
            ],
          ),
        ),
      );
    })),
  );
}
