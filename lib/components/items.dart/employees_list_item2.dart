import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/controllers/cart_controller.dart';
import 'package:bq_admin/models/simple/employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget employeesListItem2(Employee employee,
    {required dynamic onPress, required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;

  return GetX<CartController>(builder: (controller) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: controller.selectedEmployee.value == employee.empId
              ? Colors.green
              : Colors.white70,
          width: controller.selectedEmployee.value == employee.empId ? 2 : 0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: GestureDetector(
        onTap: () => {onPress(employee)},
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                "$imageBaseUrl/${employee.image}",
                fit: BoxFit.cover,
                height: width * 0.18,
                width: width,
              ),
            ),
            SizedBox(
              height: width * 0.09,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Get.locale.toString() == "en"
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        Get.locale.toString() == "en"
                            ? employee.nameEn
                            : employee.nameAr,
                        maxLines: 1,
                        style: TextStyle(
                            fontFamily: "primary",
                            fontSize: width * 0.032,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.12,
                          child: Text(
                            Get.locale.toString() == "en"
                                ? employee.countryEn
                                : employee.countryAr,
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: "primary",
                                fontSize: width * 0.025,
                                fontWeight: FontWeight.w500,
                                color: secondaryTextColor),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "${employee.exp.toString()} ${"Years".tr}",
                            maxLines: 1,
                            style: TextStyle(
                                fontFamily: "primary",
                                fontSize: width * 0.025,
                                fontWeight: FontWeight.w500,
                                color: secandaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
