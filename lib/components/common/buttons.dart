import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget iconButton({required String text, Widget? icon, dynamic onClick}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.5],
        colors: [primaryColor, secandaryColor],
      ),
      color: Colors.deepPurple.shade300,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(buttonColor),

          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (icon != null) icon,
            // const SizedBox(
            //   width: 10,
            // ),

            Text(
              text,
              style: const TextStyle(
                  color: buttonTexrColor, fontSize: 18, fontFamily: "primary"),
            ),
          ],
        )),
  );
}

ElevatedButton button({required String text, dynamic onClick}) {
  return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(secandaryColor),
      ),
      onPressed: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: TextStyle(
                color: buttonTexrColor,
                fontSize: Get.locale.toString() == "en" ? 18 : 14,
                fontFamily: "primary"),
          ),
        ],
      ));
}
