import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({Key? key}) : super(key: key);

  @override
  State<BookAppointmentView> createState() => _BookAppointmentView();
}

class _BookAppointmentView extends State<BookAppointmentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      // ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color

          statusBarColor: primaryColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: SafeArea(
          child: Column(
        children: const [
          // searchDropDown(context,
          //     value: "Akash", list: ["Akash", "Ali", "Abubakar"]),
        ],
      )),
    );
  }
}
