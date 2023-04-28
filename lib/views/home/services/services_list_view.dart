import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/no_data_widget.dart';
import 'package:bq_admin/controllers/service_controller.dart';
import 'package:bq_admin/models/simple/general_service.dart';
import 'package:bq_admin/models/simple/service.dart';
import 'package:bq_admin/views/home/services/add_service.dart';
import 'package:bq_admin/views/home/services/service_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServiceListView extends StatefulWidget {
  const ServiceListView({Key? key}) : super(key: key);
  @override
  State<ServiceListView> createState() => _ServiceListView();
}

class _ServiceListView extends State<ServiceListView> {
  ServiceController serviceController = Get.find<ServiceController>();
  @override
  void initState() {
    super.initState();
    serviceController.fetchServices();
  }

  Service getListIndex(ServiceController controller, int index) {
    Service service = Service(generalService: GeneralService());

    service = controller.services[index];
    return service;
  }

  int getListLength(ServiceController controller) {
    int length = 0;

    length = serviceController.services.length;

    return length;
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          showCart: true,
          title: "Services",
          rightIcon: GestureDetector(
            onTap: () {
              Get.to(const AddService());
            },
            child: const IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          )),
      body: SafeArea(child: GetX<ServiceController>(builder: (controller) {
        return SizedBox(
          child: getListLength(controller) == 0 && controller.loading.value
              ? const Center(child: BQLoaing())
              : getListLength(controller) == 0 && !controller.loading.value
                  ? const NoDataWidget(text: "No Service Available")
                  : SmartRefresher(
                      controller: refreshController,
                      enablePullDown: true,
                      enablePullUp: false,
                      onRefresh: () async {
                        await controller.fetchServices();

                        refreshController.refreshCompleted();
                      },
                      header: const WaterDropHeader(),
                      child: ListView.builder(
                          itemCount: getListLength(controller),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                    top: 2.0, left: 5, right: 5),
                                child: SizedBox(
                                  child: serviceItem(
                                    100,
                                    context,
                                    item: getListIndex(controller, index),
                                    onPress: (item) {},
                                  ),
                                ));
                          }),
                    ),
        );
      })),
    );
  }
}
