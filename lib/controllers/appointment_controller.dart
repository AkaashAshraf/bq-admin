import 'dart:developer';

import 'package:bq_admin/config/sub_urls.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/models/response/appoinment_list.dart';
import 'package:bq_admin/models/simple/appointment.dart';
import 'package:get/get.dart';

class AppoinmentController extends GetxController {
  RxBool loading = false.obs;
  RxBool forceLoading = false.obs;

  RxString to = "".obs;
  RxString from = "".obs;

  RxList<Appointment> appoinments = <Appointment>[].obs;
  RxInt currentUpdatingIndex = 0.obs;
  @override
  void onInit() {
    fetchAppoinments();
    super.onInit();
  }

  fetchAppoinments() async {
    try {
      loading(true);
      final result =
          await post(appointmentListUrl, {"from": from.value, "to": to.value});
      // inspect({"from": from.value, "to": to.value});
      if (result != null) {
        final products = appointmentsFromJson(result?.body);
        appoinments.value = products.data.reversed.toList();
        return products.data;
      }
    } finally {
      forceLoading(false);

      loading(false);
    }
  }

  Future<List<Appointment>> fetchEmployeeAppoinments(String empID,
      {String to = "", String from = ""}) async {
    try {
      forceLoading(true);
      final result = await post(
          appointmentListUrl, {"from": from, "to": to, "emp_id": empID});

      if (result != null) {
        final jsonResponse = appointmentsFromJson(result?.body);
        jsonResponse.data.reversed.toList();
        return jsonResponse.data.reversed.toList();
      } else {
        return [];
      }
    } finally {
      forceLoading(false);
    }
  }

  Future<bool> changeAppointmentStatus(
      {required int status, required int appointmentID}) async {
    try {
      loading(true);
      currentUpdatingIndex(appointmentID);
      final result = await post(appointmentUpdateStatusUrl,
          {"status": status.toString(), "id": appointmentID.toString()});

      if (result != null) {
        await fetchAppoinments();

        if (result.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } finally {
      currentUpdatingIndex(0);
      forceLoading(false);
      loading(false);
    }
  }
}
