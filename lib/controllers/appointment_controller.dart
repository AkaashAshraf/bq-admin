import 'package:bq_admin/config/storages.dart';
import 'package:bq_admin/config/sub_urls.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/main.dart';
import 'package:bq_admin/models/response/appoinment_list.dart';
import 'package:bq_admin/models/simple/appointment.dart';
import 'package:get/get.dart';

class AppoinmentController extends GetxController {
  RxBool loading = false.obs;
  RxList<Appointment> appoinments = <Appointment>[].obs;
  RxInt currentUpdatingIndex = 0.obs;
  @override
  void onInit() {
    fetchAppoinments();
    super.onInit();
  }

  fetchAppoinments() async {
    try {
      var userid = MyApp().storage.read(userIDPath);
      // ToastMessages.showSuccess(userid);
      loading(true);
      final result = await post(appointmentListUrl, {});

      if (result != null) {
        final products = appointmentsFromJson(result?.body);
        appoinments.value = products.data.reversed.toList();
        return products.data;
      }
    } finally {
      loading(false);
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
      loading(false);
    }
  }
}
