import 'dart:developer';

import 'package:bq_admin/components/common/single_selection_drop_down.dart';
import 'package:bq_admin/config/sub_urls.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/models/response/constants.dart';
import 'package:bq_admin/models/simple/city.dart';
import 'package:bq_admin/models/simple/country.dart';
import 'package:bq_admin/models/simple/general_service.dart';
import 'package:bq_admin/models/simple/religion.dart';
import 'package:get/get.dart';

class ConstantController extends GetxController {
  RxList<City> cities = <City>[].obs;
  RxList<Country> countries = <Country>[].obs;
  RxList<DropDown> days = <DropDown>[
    DropDown(title: "None", value: 0),
    DropDown(title: "Friday", value: 5),
    DropDown(title: "Satureday", value: 6),
    DropDown(title: "Sunday", value: 7),
    DropDown(title: "Monday", value: 1),
    DropDown(title: "Tuesday", value: 2),
    DropDown(title: "Wednesday", value: 3),
    DropDown(title: "Thursday", value: 4)
  ].obs;

  RxList<Religion> religions = <Religion>[].obs;
  RxList<GeneralService> generalServices = <GeneralService>[].obs;

  @override
  void onInit() {
    fetchConstants();
    super.onInit();
  }

  fetchConstants() async {
    try {
      // var userid = MyApp().storage.read(userIDPath);
      // ToastMessages.showSuccess(userid);
      final result = await post(fetchConstantsUrl, {});

      if (result != null) {
        final jsonResponse = constantsFromJson(result?.body);
        inspect(jsonResponse);
        religions(jsonResponse.data?.religions ?? []);
        countries(jsonResponse.data?.countries ?? []);
        generalServices(jsonResponse.data?.generalServices ?? []);
        cities(jsonResponse.data?.cities ?? []);
      }
    } finally {}
  }
}
