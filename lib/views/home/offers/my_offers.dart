import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/views/home/offers/offers_tab.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:get/get.dart';

class OffersList extends StatefulWidget {
  const OffersList({Key? key}) : super(key: key);
  @override
  State<OffersList> createState() => _OffersList();
}

class _OffersList extends State<OffersList> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'All'.tr),
    Tab(text: 'Pending'.tr),
    Tab(text: 'Confirmed'.tr),
    Tab(text: 'Rejected'.tr),
  ];
  final List<Widget> myWidgets = <Widget>[
    const OffersTab(type: 0),
    const OffersTab(type: 1),
    const OffersTab(type: 2),
    const OffersTab(type: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: "Offers", showCart: false),
      body: SafeArea(
        child: DefaultTabController(
          length: myTabs.length,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 12,
              ),
              ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                backgroundColor: topTabForground,
                unselectedBackgroundColor: topTabBackground,
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: myTabs,
              ),
              Expanded(
                child: TabBarView(children: myWidgets),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
