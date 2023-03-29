import 'dart:developer';

import 'package:bq_admin/components/common/toasts.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/config/storages.dart';
import 'package:bq_admin/config/sub_urls.dart';
import 'package:bq_admin/http/http.dart';
import 'package:bq_admin/main.dart';
import 'package:bq_admin/models/response/login.dart';
import 'package:bq_admin/models/user.dart';
import 'package:bq_admin/views/auth/log_in.dart';
import 'package:bq_admin/views/home/dashboard.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  RxBool loading = false.obs;
  RxBool checkValidation = false.obs;
  RxString contact = "".obs;
  RxString password = "".obs;
  RxString confirmPassword = "".obs;

  RxString name = "".obs;

  Rx<User> userInfo = User().obs;

  @override
  void onInit() {
    try {
      getUserInfoFromCache();
    } catch (e) {
      print(e.toString());
    }
    super.onInit();
  }

  logout() {
    MyApp().storage.remove(tokenPath);
    MyApp().storage.remove(userIDPath);
    MyApp().storage.remove(userNamePath);
    MyApp().storage.remove(userDataPath);
    name.value = "";
    contact.value = "";
    password.value = "";
    userInfo.value = User();

    Get.offAll(const SignIn());
  }

  getUserInfoFromCache() {
    final rawData = MyApp().storage.read(userDataPath);
    if (rawData == "" || rawData == null) return;
    final loginResponse = loginFromJson(rawData);
    userInfo.value = loginResponse.data!.user!;
  }

  updateProfile({
    required String nameEn,
    required String nameAr,
    required String email,
    required String contact,
    XFile? image,
  }) async {
    try {
      loading(true);

      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + updateProfileUrl));
      if (nameEn.isNotEmpty) request.fields['name_en'] = nameEn;
      if (nameAr.isNotEmpty) request.fields['name_ar'] = nameAr;
      if (contact.isNotEmpty) request.fields['contact'] = contact;
      if (email.isNotEmpty) request.fields['email'] = email;

      if (image != null) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('image', image.path);
        request.files.add(multipartFile);
      }
      var res = await multirequestPost(request);
      if (res?.statusCode == 200) {
        var resData = await res.stream.toBytes();
        var fRes = String.fromCharCodes(resData);
        var jsonData = loginFromJson(fRes);

        MyApp().storage.write(userIDPath, jsonData.data!.user!.id.toString());
        MyApp().storage.write(userNamePath, jsonData.data!.user!.name);
        MyApp().storage.write(userDataPath, loginToJson(jsonData));
        userInfo(jsonData.data?.user);
        Get.back();
      }
      return res;
    } catch (err) {
      print(err.toString());
    } finally {
      loading(false);
    }
  }

  login() async {
    if (contact.value.length < 8) {
      ToastMessages.showError("valid_number_alert".tr);
      return;
    }
    if (password.value.isEmpty) {
      ToastMessages.showError("valid_password_alert".tr);
      return;
    }
    loading(true);
    try {
      var response = await post(
          loginUrl, {"user_name": contact.value, "password": password.value});
      // inspect(response);
      if (response == null) {
        ToastMessages.showError("Invalid mobile/password");
      } else {
        if (response.statusCode == 200) {
          var jsonData = loginFromJson(response.body);
          MyApp().storage.write(tokenPath, jsonData.data!.token);
          MyApp().storage.write(userIDPath, jsonData.data!.user!.id.toString());
          MyApp().storage.write(userNamePath, jsonData.data!.user!.name);
          MyApp().storage.write(userDataPath, loginToJson(jsonData));
          ToastMessages.showSuccess("LoggedInSuccessfully".tr);
          // Get.to(const DashboardView(title: ""));
          getUserInfoFromCache();

          Get.offAll(const DashboardView());
        } else {
          ToastMessages.showError("Invalid mobile/password");
        }
      }
    } catch (e) {
      ToastMessages.showError(e.toString());
    } finally {
      loading(false);
    }
  }

  signUp() async {
    if (contact.value.length < 8) {
      ToastMessages.showError("valid_number_alert".tr);
      return;
    }

    if (name.value.isEmpty) {
      ToastMessages.showError("valid_name_alert".tr);
      return;
    }
    if (password.value != confirmPassword.value) {
      ToastMessages.showError("PasswordMismatch".tr);
      return;
    }
    loading(true);
    try {
      var response = await post(signUpUrl, {
        "user_name": contact.value,
        "password": password.value,
        "name": name.value
      });
      if (response != null) {
        var jsonData = loginFromJson(response.body);
        MyApp().storage.write(tokenPath, jsonData.data!.token);
        MyApp().storage.write(userIDPath, jsonData.data!.user!.id.toString());
        MyApp().storage.write(userNamePath, jsonData.data!.user!.name);
        MyApp().storage.write(userDataPath, loginToJson(jsonData));
        ToastMessages.showSuccess("LoggedInSuccessfully".tr);
        // Get.to(const DashboardView(title: ""));
        getUserInfoFromCache();
        // Get.offAll(const DashboardView(title: ""));

        // Get.toEnd(() => const DashboardView(title: ""));
      } else {
        ToastMessages.showError("ThisNumberAlreadyExist".tr);
      }
    } catch (e) {
      ToastMessages.showError(e.toString());
    } finally {
      loading(false);
    }
  }
}
