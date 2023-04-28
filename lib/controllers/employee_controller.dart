import 'dart:developer';

import 'package:bq_admin/components/common/toasts.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/storages.dart';
import 'package:bq_admin/config/sub_urls.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/main.dart';
import 'package:bq_admin/models/response/employees.dart';
import 'package:bq_admin/models/response/general_response.dart';
import 'package:bq_admin/models/simple/employee.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EmployeeController extends GetxController {
  RxList<Employee> employees = <Employee>[].obs;
  RxBool updateStatusLoading = false.obs;
  RxInt updateStatusID = 0.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchEmployees();

    super.onInit();
  }

  fetchEmployees() async {
    try {
      loading(true);
      var userID = await MyApp().storage.read(userIDPath) ?? "";

      final result = await post(employeesListUrl, {
        'saloon_id': userID.toString(),
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

  fetchEmployeeDetails(String empID) async {
    try {
      loading(true);
      final result = await post(employeesDetaislUrl, {
        'emp_id': empID,
      });
      return result;
    } finally {
      loading(false);
    }
  }

  blockUnblockEmployee({required int status, required int employeeID}) async {
    try {
      updateStatusLoading(true);
      updateStatusID(employeeID);
      loading(true);
      final result = await post(employeesChangeStatusUrl,
          {"status": status.toString(), "emp_id": employeeID.toString()});
      // inspect(result);
      if (result != null) {
        var res = generalResponseFromJson(result?.body);
        if (res.status == 1) {
          ToastMessages.showSuccess(
              Get.locale.toString() == "en" ? res.message : res.messageAr);
          await fetchEmployees();
        } else {
          ToastMessages.showError(
              Get.locale.toString() == "en" ? res.message : res.messageAr);
        }
        return true;
      } else {
        return false;
      }
    } finally {
      updateStatusLoading(false);
      updateStatusID(0);
      loading(false);
    }
  }

  addEmployee({
    required String nameEn,
    required String nameAr,
    required String contact,
    required String holiday1,
    required String holiday2,
    required String experience,
    required int empID,
    required int country,
    required int religion,
    required XFile? image,
  }) async {
    try {
      loading(true);

      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              baseUrl + (empID > 0 ? employeesUpdateUrl : employeesAddUrl)));
      request.fields['name_en'] = nameEn;
      request.fields['emp_id'] = empID.toString();

      request.fields['name_ar'] = nameAr;
      request.fields['contact'] = contact;
      request.fields['holiday_1'] = holiday1;
      request.fields['holiday_2'] = holiday2;

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
