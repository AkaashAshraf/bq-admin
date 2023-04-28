import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperController extends GetxController {
  openLocation({
    required dynamic latitude,
    required dynamic longitude,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;

    await availableMaps.first.showMarker(
      coords: Coords(double.tryParse(latitude.toString()) ?? 0.0,
          double.tryParse(longitude.toString()) ?? 0.0),
      title: "",
      description: "",
    );
  }

  openUrl({required String url}) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }

  String getHolidaysName(int day1, day2) {
    String firstDay = getDayName(day1);
    String secondDay = getDayName(day2);
    return "${firstDay.isNotEmpty ? ('$firstDay,') : ""} $secondDay";
  }

  String getDayName(day) {
    switch (day) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Satureday";
      case 7:
        return "Sunday";

      default:
        return "";
    }
  }

  String getStatusMessage(int status) {
    switch (status) {
      case 1:
        return "Pending".tr;
      case 2:
        return "Confirmed".tr;
      case 3:
        return "Availed".tr;
      case 4:
        return "Rejected".tr;
      case 5:
        return "Cancelled".tr;

      default:
        return "Pending".tr;
    }
  }

  Color getStatusColor(int status) {
    switch (status) {
      case 1:
        return Colors.orange;
      case 2:
        return Colors.green;
      case 3:
        return primaryColor;
      case 4:
        return Colors.red;
      case 5:
        return Colors.red;

      default:
        return Colors.orange;
    }
  }
}
