import 'package:bq_admin/config/storages.dart';
import 'package:bq_admin/config/sub_urls.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/main.dart';
import 'package:bq_admin/models/response/appoinment_list.dart';
import 'package:bq_admin/models/simple/appointment.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  RxBool loading = false.obs;
  RxList<Appointment> offers = <Appointment>[].obs;
  RxInt currentUpdatingIndex = 0.obs;
  @override
  void onInit() {
    fetchOffers();
    super.onInit();
  }

  fetchOffers() async {
    try {
      var userid = MyApp().storage.read(userIDPath);
      // ToastMessages.showSuccess(userid);
      loading(true);
      final result = await post(appointmentListUrl, {});

      if (result != null) {
        final products = appointmentsFromJson(result?.body);
        offers.value = products.data.reversed.toList();
        return products.data;
      }
    } finally {
      loading(false);
    }
  }

  Future<bool> changeOffersStatus(
      {required int status, required int offersID}) async {
    try {
      loading(true);
      currentUpdatingIndex(offersID);
      final result = await post(appointmentUpdateStatusUrl,
          {"status": status.toString(), "id": offersID.toString()});

      if (result != null) {
        await fetchOffers();

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
