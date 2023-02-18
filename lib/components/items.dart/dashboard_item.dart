import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

Widget dashboardItem(double height, double width,
    {required dynamic onTap, required String imgName, required String title}) {
  return SizedBox(
    // height: width * 0.4,
    // width: width * 0.35,
    child: Animate(
      effects: const [
        FadeEffect(delay: Duration(milliseconds: 400)),
        ScaleEffect(curve: Curves.linear, delay: Duration(milliseconds: 400))
      ],
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 6,
                  color: dashboardItemBorderColor,
                ),
                shape: BoxShape.circle,
              ),
              height: width * 0.33,
              width: width * 0.33,
              child: ClipOval(
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/$imgName'))
                  //  CachedNetworkImage(
                  //   fit: BoxFit.cover,
                  //   imageUrl: "$imageBaseUrl/Assets/$imgName",
                  //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                  //       CircularProgressIndicator(
                  //           value: downloadProgress.progress),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                    fontSize: Get.locale.toString() == "en"
                        ? width * 0.045
                        : width * 0.04,
                    color: dashboardTextColor,
                    fontFamily: "primary",
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
