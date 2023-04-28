import 'dart:developer';

import 'package:bq_admin/components/common/toasts.dart';
import 'package:bq_admin/config/storages.dart';
import 'package:bq_admin/controllers/auth_controller.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/main.dart';
import 'package:bq_admin/models/simple/cart.dart';
import 'package:bq_admin/models/simple/employee.dart';
import 'package:bq_admin/models/simple/saloon.dart';
import 'package:bq_admin/views/home/dashboard.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  RxInt selectedEmployee = 0.obs;
  Rx<Saloon> selectedSaloon = Saloon().obs;
  RxInt saloonID = 0.obs;

  RxList<Employee> employeesList = <Employee>[].obs;

  double get totalPrice => items.fold(0, (sum, item) => sum + (item.unitPrice));
  double get totalTime => items.fold(0, (sum, item) => sum + (item.time));

  RxBool loading = false.obs;

  RxBool saloonListLoading = false.obs;

  // fetchEmployees(int id) async {
  //   employeesList.value =
  //       await Get.put(SaloonsController()).fetchEmployeesList(id: id);
  // }

  emptyCart() {
    items.value = [];
    ToastMessages.showSuccess("CartHasBeenClearedSuccessfully".tr);
  }

  bool addToCart(CartItem item) {
    var contain = items.where((element) => element.productID == item.productID);
    if (contain.isEmpty) {
      items.add(item);
      ToastMessages.showSuccess("Added To Cart".tr);
      // if (items.length == 1) {
      // fetchEmployees(selectedSaloon.value.id ?? 0);
      // }

      return true;
    } else {
      ToastMessages.showWarning("Already Added".tr);

      return false;
    }
  }

  checkout(
      {required String datetime,
      required String name,
      required String contact}) async {
    try {
      loading(true);
      if (datetime.isEmpty) {
        ToastMessages.showError("PleaseSelectAppointmentDateTime".tr);
        return;
      }
      if (selectedEmployee.value == 0) {
        ToastMessages.showError("PleaseSelectEmployee".tr);
        return;
      }
      if (items.isEmpty) {
        ToastMessages.showError("PleaseSelectServices".tr);
        return;
      }
      if (name.isEmpty) {
        ToastMessages.showError("Please Enter Customer Name".tr);
        return;
      }
      if (contact.isEmpty) {
        ToastMessages.showError("Please Enter Customer Contact".tr);
        return;
      }
      var map = new Map<String, dynamic>();
      // var userid = MyApp().storage.read(userIDPath);
      var userID = await MyApp().storage.read(userIDPath) ?? "";

      // map['user_id'] = userid.toString();
      map['emp_id'] = selectedEmployee.toString();
      map['by_admin'] = "1";

      map['name'] = name;
      map['saloon_id'] = userID.toString();

      map['contact'] = contact;

      map['date'] = datetime;
      map['saloon_id'] =
          Get.find<AuthController>().userInfo.value.id.toString();
      // map['service_ids[0]'] = '6';
      for (int i = 0; i < items.length; i++) {
        map['service_ids[${i.toString()}]'] = items[i].productID.toString();
      }
      inspect(map);
      var res = await post("/client/appointment/add", map);
      // ToastMessages.showError(res.statusCode.toString());
      // print(res.statusCode.toString());
      loading(false);
      if (res?.statusCode == 200) {
        ToastMessages.showSuccess("AppointmentSuccessToast".tr);
        items.value = [];
        Get.offAll(const DashboardView());
      } else {
        // ToastMessages.showError("Something went wrong");
      }
    } catch (e) {
    } finally {
      loading(false);
    }
  }
}
