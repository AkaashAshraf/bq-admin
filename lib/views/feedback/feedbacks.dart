import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbacksList extends StatefulWidget {
  const FeedbacksList({Key? key}) : super(key: key);
  @override
  State<FeedbacksList> createState() => _FeedbacksList();
}

class _FeedbacksList extends State<FeedbacksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Feed Back".tr, showCart: false),
      body: SafeArea(
        child: Center(
            child: Text(
          "No Feedback Available".tr,
          style: TextStyle(
              fontFamily: "primary", fontSize: screenWidth(context) * 0.04),
        )),
      ),
    );
  }
}
