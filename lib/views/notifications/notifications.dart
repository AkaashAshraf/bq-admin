import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsList extends StatefulWidget {
  const NotificationsList({Key? key}) : super(key: key);
  @override
  State<NotificationsList> createState() => _NotificationsList();
}

class _NotificationsList extends State<NotificationsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(title: "Notifications".tr, showCart: false),
      body: SafeArea(
        child: Center(
            child: Text(
          "NoNotificationsAvailable".tr,
          style: TextStyle(
              fontFamily: "primary", fontSize: screenWidth(context) * 0.04),
        )),
      ),
    );
  }
}
