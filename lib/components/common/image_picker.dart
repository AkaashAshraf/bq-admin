import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';

import "package:get/get.dart";

Padding customImagePicker(
    {String hint = "",
    String validator = "",
    double width = 200,
    dynamic alignment = Alignment.center,
    dynamic image,
    bool isImageSelect = false,
    dynamic onTap}) {
  return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Align(
        alignment: alignment,
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 1,
                        color: validator.isNotEmpty ? Colors.red : primaryColor,
                      )),
                  width: width,
                  height: width * 0.15,
                  child: !isImageSelect
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: width * 0.7,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    "addImage".tr,
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: primaryColor),
                                  ),
                                )),
                            SizedBox(
                                width: width * 0.2,
                                child: const Icon(
                                  Icons.attach_file,
                                  color: primaryColor,
                                ))
                          ],
                        )
                      : Container()),
              if (validator.isNotEmpty)
                Row(
                  children: [
                    Text(
                      validator,
                      style:
                          TextStyle(fontSize: width * 0.035, color: Colors.red),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ));
}
