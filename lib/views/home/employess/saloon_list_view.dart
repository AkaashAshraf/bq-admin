import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/no_data_widget.dart';
import 'package:bq_admin/controllers/employee_controller.dart';
import 'package:bq_admin/models/simple/employee.dart';
import 'package:bq_admin/views/home/employess/add_employee.dart';
import 'package:bq_admin/views/home/employess/saloon_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaloonListView extends StatefulWidget {
  const SaloonListView({Key? key}) : super(key: key);
  @override
  State<SaloonListView> createState() => _SaloonListView();
}

class _SaloonListView extends State<SaloonListView> {
  EmployeeController employeesController = Get.find<EmployeeController>();
  @override
  void initState() {
    super.initState();
  }

  Employee getListIndex(EmployeeController controller, int index) {
    Employee employee = Employee();

    employee = controller.employees[index];
    return employee;
  }

  int getListLength(EmployeeController controller) {
    int length = 0;

    length = employeesController.employees.length;

    return length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: "Employees",
          rightIcon: GestureDetector(
            onTap: () {
              Get.to(const AddEmployee());
            },
            child: const IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          )),
      body: SafeArea(child: GetX<EmployeeController>(builder: (controller) {
        return SizedBox(
          child: getListLength(controller) == 0 && controller.loading.value
              ? const Center(child: BQLoaing())
              : getListLength(controller) == 0 && !controller.loading.value
                  ? const NoDataWidget(text: "No Employee Available")
                  : ListView.builder(
                      itemCount: getListLength(controller),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, left: 5, right: 5),
                            child: SizedBox(
                              child: saloonItem(
                                100,
                                context,
                                item: getListIndex(controller, index),
                                onPress: (item) {},
                              ),
                            ));
                      }),
        );
      })),
    );
  }
}
