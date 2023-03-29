import 'dart:developer';

import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/sub_urls.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/models/response/employees.dart';
import 'package:bq_admin/models/simple/employee.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EmployeeController extends GetxController {
  RxList<Employee> employees = <Employee>[].obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchEmployees();

    super.onInit();
  }

  fetchEmployees() async {
    try {
      loading(true);
      final result = await post(employeesListUrl, {
        'saloon_id': "1",
        "type": "all",
      });
      if (result != null) {
        final data = employeesFromJson(result?.body);
        employees(data.data);
      }
    } finally {
      loading(false);
    }
  }

  blockUnblockEmployee({required int status, required int saloonID}) async {
    try {
      loading(true);
      final result = await post(employeesChangeStatusUrl,
          {"status": status.toString(), "saloon_id": saloonID.toString()});
      inspect(result);
      if (result != null) {
        fetchEmployees();

        return true;
      } else {
        return false;
      }
    } finally {
      loading(false);
    }
  }

  addEmployee({
    required String nameEn,
    required String nameAr,
    required String contact,
    required String experience,
    // required int city,
    required int country,
    required int religion,
    required XFile? image,
  }) async {
    try {
      loading(true);

      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + employeesAddUrl));
      request.fields['name_en'] = nameEn;

      request.fields['name_ar'] = nameAr;
      request.fields['contact'] = contact;
      request.fields['country'] = country.toString();

      request.fields['relegion'] = religion.toString();
      // request.fields['description_ar'] = experience.toString();
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
}
