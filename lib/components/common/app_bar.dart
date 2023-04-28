import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/controllers/cart_controller.dart';
import 'package:bq_admin/views/home/services/cart.dart';
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

AppBar appBar(
    {required String title, bool showCart = false, Widget? rightIcon}) {
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
        GetX<CartController>(builder: (controller) {
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 150.0,
                  width: 30.0,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const Cart());
                      // Get.put(CartController()).items.add(Service());
                    },
                    child: Stack(
                      children: <Widget>[
                        const IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          onPressed: null,
                        ),
                        if (controller.items.isNotEmpty)
                          Positioned(
                              child: Stack(
                            children: <Widget>[
                              Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.green[800]),
                              Positioned(
                                  top: 4.0,
                                  bottom: 4.0,
                                  right: 4.0,
                                  left: 4.0,
                                  child: Center(
                                    child: Text(
                                      controller.items.length.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                      ],
                    ),
                  )));
        }),
      if (rightIcon != null)
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(child: rightIcon))
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
