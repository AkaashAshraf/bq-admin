import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextSizes {
  double height;
  double width;
  double navTitle;
  double dashboardItem;
  double itemMainText;
  double itemSubText;
  double authTitleText;

  double smallItemMainText;
  double smallItemSubText;

  double twoColumnGridMainText;
  double twoColumnGridSubText;

  TextSizes(
      {required this.dashboardItem,
      required this.itemMainText,
      required this.height,
      required this.width,
      required this.authTitleText,
      required this.itemSubText,
      required this.navTitle,
      required this.smallItemMainText,
      required this.smallItemSubText,
      required this.twoColumnGridMainText,
      required this.twoColumnGridSubText});
}

TextSizes getTextSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  final sizes = TextSizes(
    height: height,
    width: width,
    dashboardItem: width * 0.045,
    authTitleText: width * 0.055,
    itemMainText: width * 0.045,
    itemSubText: width * 0.038,
    navTitle: width * 0.045,
    smallItemMainText:
        Get.locale.toString() == "en" ? width * 0.045 : width * 0.04,
    smallItemSubText: width * 0.032,
    twoColumnGridMainText: width * 0.035,
    twoColumnGridSubText: width * 0.032,
  );
  return sizes;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
