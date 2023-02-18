import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

AppBar noAppBar({bool showCart = true}) {
  return AppBar(
    elevation: 0,
    backgroundColor: primaryColor,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: primaryColor,

      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    actions: const [],
  );
}

AppBar appBar({required String title, bool showCart = true}) {
  return AppBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
      ),
    ),
    elevation: 1,
    actions: [
      if (showCart)
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                height: 150.0,
                width: 30.0,
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: const <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                    ],
                  ),
                )))
    ],
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          color: appBarTitleColor,
          fontSize: Get.locale.toString() == "en" ? 22 : 18,
          fontFamily: "primary",
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    ),
    backgroundColor: primaryColor,
    // shadowColor: Colors.black,
    systemOverlayStyle: const SystemUiOverlayStyle(
      // Status bar color

      statusBarColor: primaryColor,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  );
}
