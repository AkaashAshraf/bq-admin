import 'dart:developer';
import 'dart:io';

import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/image_picker.dart';
import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/simple_button.dart';
import 'package:bq_admin/components/common/simple_text_input.dart';
import 'package:bq_admin/components/common/single_selection_drop_down.dart';
// import 'package:bq_admin/components/common/single_selection_drop_down.dart';
import 'package:bq_admin/components/common/toasts.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:bq_admin/controllers/constant_controller.dart';
import 'package:bq_admin/controllers/employee_controller.dart';
import 'package:bq_admin/controllers/helper_controller.dart';
import 'package:bq_admin/models/simple/employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key, required this.employee});
  final Employee employee;
  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  HelperController helperController = Get.put(HelperController());

  var isValidate = false;
  int employeeId = 0;
  String imageSelectionType = "gallery".tr;
  XFile? image1;
  // int city = 0;
  String nameEn = "";
  String nameAr = "";
  String contact = "N/A";
  String experience = "";

  int country = 0;
  int holiday1 = 0;
  int holiday2 = 0;

  int religion = 100;

  String notifyingStock = "";
  bool checkValidation() {
    if (nameEn.isEmpty || nameAr.isEmpty || country == 0) {
      ToastMessages.showError("Some data is missing");

      return false;
    }
    if (employeeId == 0 && image1 == null) {
      ToastMessages.showError("Some data is missing");

      return false;
    }
    return true;
  }

  @override
  void initState() {
    if (widget.employee.empId > 0) {
      setState(() {
        employeeId = widget.employee.empId;
        nameEn = widget.employee.nameEn;
        nameAr = widget.employee.nameAr;
        country = widget.employee.country;
        holiday1 = widget.employee.holiday1;
        holiday2 = widget.employee.holiday2;
      });
    }
    super.initState();
  }

  ConstantController constantController = Get.find<ConstantController>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:
          appBar(title: employeeId > 0 ? "Update Employee" : "Add Employee"),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: GetX<EmployeeController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width,
                    child: SimpleInputField(
                      title: "Name EN",
                      hint: "writeHere".tr,
                      initialValue: nameEn,
                      validator:
                          isValidate && nameEn.isEmpty ? "required".tr : "",
                      onTextChange: (val) {
                        setState(() {
                          nameEn = val;
                        });
                      },
                    ),
                  ),
                  // Expanded(
                  //   child: SimpleInputField(
                  //     title: "Name AR",
                  //     hint: "writeHere".tr,
                  //     initialValue: nameAr,
                  //     validator:
                  //         isValidate && nameAr.isEmpty ? "required".tr : "",
                  //     onTextChange: (val) {
                  //       setState(() {
                  //         nameAr = val;
                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width,
                    child: SimpleInputField(
                      title: "Name AR",
                      hint: "writeHere".tr,
                      initialValue: nameAr,
                      validator:
                          isValidate && nameAr.isEmpty ? "required".tr : "",
                      onTextChange: (val) {
                        setState(() {
                          nameAr = val;
                        });
                      },
                    ),
                  ),
                  // Expanded(
                  //   child: SimpleInputField(
                  //     title: "Name AR",
                  //     hint: "writeHere".tr,
                  //     initialValue: nameAr,
                  //     validator:
                  //         isValidate && nameAr.isEmpty ? "required".tr : "",
                  //     onTextChange: (val) {
                  //       setState(() {
                  //         nameAr = val;
                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // SimpleInputField(
              //   title: "Contact",
              //   hint: "writeHere".tr,
              //   keyBoardType: TextInputType.number,
              //   initialValue: contact,
              //   validator: isValidate && contact.isEmpty
              //       ? "required".tr
              //       : isValidate && contact.length < 8
              //           ? "invalid contact"
              //           : "",
              //   onTextChange: (val) {
              //     setState(() {
              //       contact = val;
              //     });
              //   },
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // SingleSelectionSimpleDropDown(
              //     title: "City",
              //     validator: isValidate && city == 0 ? "required" : "",
              //     onChange: (DropDown val) {
              //       setState(() {
              //         city = val.value;
              //       });
              //     },
              //     selected: 0,
              //     items: constantController.cities
              //         .map((element) => DropDown(
              //             title: element.nameEn ?? "", value: element.id ?? 0))
              //         .toList()),

              Row(
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.49,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Holiday 1",
                                style: TextStyle(
                                    fontFamily: "primary",
                                    fontSize: screenWidth(context) * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SingleSelectionSimpleDropDown(
                            title: "Holiday 1",
                            onChange: (DropDown val) {
                              // inspect(val);
                              setState(() {
                                holiday1 = val.value;
                              });
                            },
                            selected: holiday1,
                            items: constantController.days),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Holiday 2",
                                style: TextStyle(
                                    fontFamily: "primary",
                                    fontSize: screenWidth(context) * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SingleSelectionSimpleDropDown(
                            title: "Holiday 2",
                            onChange: (DropDown val) {
                              // inspect(val);
                              setState(() {
                                holiday2 = val.value;
                              });
                            },
                            selected: holiday2,
                            items: constantController.days),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Country",
                      style: TextStyle(
                          fontFamily: "primary",
                          fontSize: screenWidth(context) * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SingleSelectionSimpleDropDown(
                  title: "Country",
                  validator: isValidate && country == 0 ? "required" : "",
                  onChange: (DropDown val) {
                    // inspect(val);
                    setState(() {
                      country = val.value;
                    });
                  },
                  selected: country,
                  items: constantController.countries
                      .map((element) => DropDown(
                          title: element.nameEn ?? "", value: element.id ?? 0))
                      .toList()),
              // const SizedBox(
              //   height: 10,
              // ),
              // SingleSelectionSimpleDropDown(
              //     title: "Religion",
              //     validator: isValidate && religion == 0 ? "required" : "",
              //     onChange: (DropDown val) {
              //       setState(() {
              //         religion = val.value;
              //       });
              //     },
              //     selected: 0,
              //     items: constantController.religions
              //         .map((element) => DropDown(
              //             title: element.nameEn ?? "", value: element.id ?? 0))
              //         .toList()),
              const SizedBox(
                height: 10,
              ),
              customImagePicker(
                hint: '',
                width: width,
                validator: isValidate && image1 == null && employeeId == 0
                    ? "imageIsRequired".tr
                    : "",
                onTap: () async {
                  // AlertText(context, 'txt').show();
                  var tempImage = (await ImagePicker().pickImage(
                      source: imageSelectionType == "gallery".tr
                          ? ImageSource.gallery
                          : ImageSource.camera));
                  // inspect(tempImage);
                  {
                    setState(() {
                      image1 = tempImage;
                    });
                  }
                },
                // keyBoardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  if (image1 != null)
                    imageViewer(image1!, () {
                      setState(() {
                        image1 = null;
                      });
                    }),
                ],
              ),
              if (controller.loading.value)
                const BQLoaing()
              else
                SizedBox(
                  width: width * 0.9,
                  height: height * 0.06,
                  child: SimpleButton(
                    title: employeeId > 0 ? "Update" : "Create",
                    onPress: () async {
                      // print(DateTime.now().weekday);
                      // return;
                      setState(() {
                        isValidate = true;
                      });
                      // if (image1 == null && productId == 0) {
                      //   tamweenToastMessage(
                      //           context: context,
                      //           type: "error",
                      //           descripetion: "Image is required")
                      //       .show(context);
                      // }
                      if (!checkValidation()) {
                        return;
                      }
                      var res =
                          await Get.find<EmployeeController>().addEmployee(
                        nameEn: nameEn,
                        nameAr: nameAr,
                        holiday1: holiday1.toString(),
                        holiday2: holiday2.toString(),
                        contact: contact,
                        empID: employeeId,
                        experience: experience,
                        country: country,
                        // city: city,
                        religion: religion,
                        image: image1,
                      );
                      // inspect(res);
                      if (res != null) {
                        ToastMessages.showSuccess(employeeId > 0
                            ? "Employee has been updated successfully"
                            : "Employee has been added successfully");
                        Get.back();
                        if (employeeId > 0) {
                          Get.back();
                        }
                        controller.fetchEmployees();
                      }
                    },
                  ),
                ),
              const SizedBox(
                height: 250,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget imageViewer(XFile image, dynamic onTap) {
    return SizedBox(
        height: 150,
        width: 90,
        child: Row(
          children: [
            SizedBox(
              height: 150,
              width: 25,
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: Image.asset(
                    'assets/images/cross.png',
                    height: 17,
                    width: 17,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Image.file(
                File(image.path),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }
}
