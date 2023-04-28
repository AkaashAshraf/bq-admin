import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/simple_button.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/employee_controller.dart';
import 'package:bq_admin/models/simple/employee.dart';
import 'package:bq_admin/views/home/employess/employee_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget saloonItem(double cardHeight, BuildContext context,
    {required Employee item,
    required dynamic onPress,
    required EmployeeController controller}) {
  return GestureDetector(
    onTap: () {
      onPress(item);
    },
    child: SizedBox(
        child: Padding(
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
                      Get.locale.toString() == "en" ? item.nameEn : item.nameAr,
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
                          "Country",
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontFamily: "primary",
                          ),
                        ),
                        Text(
                          item.countryEn,
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
                          "Experience",
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontFamily: "primary",
                          ),
                        ),
                        Text(
                          "${item.exp} years",
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
                                : item.isActive == 1
                                    ? "Active"
                                    : "Deactive",
                            style: TextStyle(
                              color: item.isBlocked == 1
                                  ? Colors.red
                                  : item.isActive == 1
                                      ? Colors.green
                                      : Colors.red,
                              fontFamily: "primary",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GetX<EmployeeController>(builder: (controller) {
                    return SizedBox(
                      width: screenWidth(context) * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SimpleButton(
                              backgroundColor: Colors.green,
                              title: "View",
                              onPress: () {
                                Get.to(EmployeeDetailsView(employee: item));
                                // controller.blockUnblockEmployee(
                                //     status: item.isActive == 0 ? 1 : 0,
                                //     employeeID: item.empId);
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          controller.updateStatusLoading.value &&
                                  controller.updateStatusID.value == item.empId
                              ? const BQLoaing(height: 25, width: 25)
                              : SimpleButton(
                                  backgroundColor: item.isActive == 0
                                      ? Colors.green
                                      : Colors.red,
                                  title: item.isActive == 0
                                      ? "Active Now"
                                      : "Deativate ",
                                  onPress: () {
                                    controller.blockUnblockEmployee(
                                        status: item.isActive == 0 ? 1 : 0,
                                        employeeID: item.empId);
                                  }),
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    )),
  );
}
