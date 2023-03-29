import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/buttons.dart';
import 'package:bq_admin/components/common/drawer.dart';
import 'package:bq_admin/components/common/generic_popup.dart';
import 'package:bq_admin/components/items.dart/dashboard_item.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/controllers/appointment_controller.dart';
import 'package:bq_admin/controllers/constant_controller.dart';
import 'package:bq_admin/controllers/employee_controller.dart';
import 'package:bq_admin/controllers/helper_controller.dart';
import 'package:bq_admin/controllers/service_controller.dart';
import 'package:bq_admin/views/feedback/feedbacks.dart';
import 'package:bq_admin/views/home/appoinments/my_appointments.dart';
import 'package:bq_admin/views/home/employess/saloon_list_view.dart';
import 'package:bq_admin/views/home/offers/my_offers.dart';
import 'package:bq_admin/views/home/services/services_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardView();
}

class _DashboardView extends State<DashboardView> {
  EmployeeController employeeController = Get.put(EmployeeController());
  ServiceController serviceController = Get.put(ServiceController());
  AppoinmentController appoinmentController = Get.put(AppoinmentController());
  ConstantController constantController = Get.put(ConstantController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      // ),
      drawer: MenuDrawer(),
      appBar: noAppBar(showCart: false),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryColor, secandaryColor],
          )),
          height: height,
          width: width,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 10, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Beauty Queens".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: dashbboardTitleColor,
                            fontFamily: "primary",
                            fontSize: width * 0.08),
                      ).animate().scale(delay: 200.ms, duration: 400.ms),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dashboardItem(height, width,
                                  imgName: "services.png",
                                  title: "Services".tr, onTap: () {
                                Get.to(const ServiceListView());
                              }),
                              dashboardItem(height, width,
                                  imgName: "employees.jpeg",
                                  title: "Employees".tr, onTap: () {
                                Get.to(const SaloonListView());
                              }),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dashboardItem(height, width,
                                  imgName: "bookings.png",
                                  title: "Bookings".tr, onTap: () {
                                Get.to(const MyAppointmentsList());
                              }),
                              dashboardItem(height, width,
                                  imgName: "offerss.jpeg",
                                  title: "Offers".tr, onTap: () {
                                Get.to(const OffersList());
                              }),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              dashboardItem(height, width,
                                  imgName: "feedback.png",
                                  title: "Feed Back".tr, onTap: () {
                                // Get.put(ShopsController()).fetchShopsList();

                                Get.to(const FeedbacksList());
                              }),
                              dashboardItem(height, width,
                                  imgName: "s_support.jpeg",
                                  title: "JoinUs".tr, onTap: () {
                                genericPopup(context,
                                    title: "JoinUs".tr,
                                    children: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          width: width * 0.5,
                                          child: iconButton(
                                            onClick: () {
                                              Get.put(HelperController()).openUrl(
                                                  url:
                                                      "tel:$contactSuppportCallNumber");
                                              Navigator.pop(context);
                                            },
                                            text: "Call".tr,
                                            icon: const Icon(
                                              Icons.phone,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: width * 0.5,
                                          child: iconButton(
                                            onClick: () {
                                              Get.put(HelperController()).openUrl(
                                                  url:
                                                      "whatsapp://send?phone=$contactSuppportWhatsAppNumber&text=");
                                              Navigator.pop(context);
                                            },
                                            text: "Whatsapp".tr,
                                            icon: const Icon(
                                              Icons.whatsapp,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: width * 0.5,
                                          child: iconButton(
                                            onClick: () {
                                              Get.put(HelperController()).openUrl(
                                                  url:
                                                      "mailto:$contactSuppportEmail");
                                              Navigator.pop(context);
                                            },
                                            text: "Email".tr,
                                            icon: const Icon(
                                              Icons.email,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )).show();
                              }),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
