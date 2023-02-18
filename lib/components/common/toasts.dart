import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class ToastMessages {
  static bool isShown = false;
  static showError(String msg) {
    if (!isShown) {
      isShown = true;

      // Fluttertoast.showToast(
      //     msg: msg,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      // isShown = true;
    }

    Future.delayed(const Duration(milliseconds: 3000), () {
      isShown = false;
    });
  }

  static showSuccess(String msg) {
    // Fluttertoast.showToast(
    //     msg: msg,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.TOP,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  static showWarning(String msg) {
    // Fluttertoast.showToast(
    //     msg: msg,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.TOP,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.orange,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }
}
