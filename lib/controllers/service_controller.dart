import 'dart:developer';

import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/sub_urls.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/models/response/services.dart';
import 'package:bq_admin/models/simple/service.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ServiceController extends GetxController {
  RxList<Service> services = <Service>[].obs;

  RxBool loading = false.obs;
  RxBool updateStatusLoading = false.obs;
  RxInt updateStatusID = 0.obs;

  @override
  void onInit() {
    fetchServices();

    super.onInit();
  }

  fetchServices() async {
    try {
      loading(true);
      final result = await post(serviceListUrl, {
        "type": "all",
      });
      inspect(result);
      if (result != null) {
        final data = servicesFromJson(result?.body);
        services(data.data);
      }
    } finally {
      loading(false);
    }
  }

  blockUnblockSerivce({required int status, required int serviceId}) async {
    try {
      inspect({status, serviceId});

      updateStatusID(serviceId);
      updateStatusLoading(true);

      loading(true);
      final result = await post(serviceChangeStatusUrl,
          {"type": status.toString(), "service_id": serviceId.toString()});
      await fetchServices();

      if (result != null) {
        return true;
      } else {
        return false;
      }
    } finally {
      updateStatusID(0);
      updateStatusLoading(false);
      loading(false);
    }
  }

  addService({
    required int service,
    required String descriptionEn,
    required String price,
    required String disountedPrice,
    required String descriptionAr,
    required String time,
    required XFile? image,
  }) async {
    try {
      loading(true);

      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + serviceAddUrl));

      request.fields['service'] = service.toString();
      request.fields['charges'] = price;
      request.fields['disounted_price'] = disountedPrice;

      request.fields['time'] = time;

      request.fields['description_en'] = descriptionEn;
      request.fields['description_ar'] = descriptionAr;
      if (image != null) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('image', image.path);
        request.files.add(multipartFile);
      }
      var res = await multirequestPost(request);
      return res;
    } catch (err) {
      print(err.toString());
    } finally {
      loading(false);
    }
  }

  updateService({
    required int service,
    required int id,
    required String descriptionEn,
    required String price,
    required String disountedPrice,
    required String descriptionAr,
    required String time,
    required XFile? image,
  }) async {
    try {
      loading(true);

      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + serviceUpdateUrl));

      request.fields['service'] = service.toString();
      request.fields['id'] = id.toString();

      request.fields['charges'] = price;
      request.fields['disounted_price'] = disountedPrice;

      request.fields['time'] = time;

      request.fields['description_en'] = descriptionEn;
      request.fields['description_ar'] = descriptionAr;
      if (image != null) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('image', image.path);
        request.files.add(multipartFile);
      }

      var res = await multirequestPost(request);
      var resData = await res.stream.toBytes();
      var fRes = String.fromCharCodes(resData);
      return fRes;
    } catch (err) {
      print(err.toString());
    } finally {
      loading(false);
    }
  }
}
