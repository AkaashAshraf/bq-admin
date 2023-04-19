import 'dart:developer';
import 'dart:io';

import 'package:bq_admin/components/common/app_bar.dart';
import 'package:bq_admin/components/common/image_picker.dart';
import 'package:bq_admin/components/common/loading_indicator%20copy.dart';
import 'package:bq_admin/components/common/simple_button.dart';
import 'package:bq_admin/components/common/simple_text_input.dart';
import 'package:bq_admin/components/common/single_selection_drop_down.dart';
import 'package:bq_admin/components/common/toasts.dart';
import 'package:bq_admin/config/constants.dart';
import 'package:bq_admin/controllers/constant_controller.dart';
import 'package:bq_admin/controllers/helper_controller.dart';
import 'package:bq_admin/controllers/service_controller.dart';
import 'package:bq_admin/models/response/general_response.dart';
import 'package:bq_admin/models/simple/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateService extends StatefulWidget {
  const UpdateService({super.key, required this.service});
  final Service service;
  @override
  State<UpdateService> createState() => _UpdateServiceState();
}

class _UpdateServiceState extends State<UpdateService> {
  HelperController helperController = Get.put(HelperController());
  ConstantController constantController = Get.find<ConstantController>();

  var isValidate = false;
  int id = 0;

  String imageSelectionType = "gallery".tr;
  XFile? image1;
  String imagePath = "";

  String price = "";
  String time = "";
  int service = 0;

  String descriptionEn = "";
  String descriptionAr = "";

  bool checkValidation() {
    if (price.isEmpty ||
        time.isEmpty ||
        descriptionEn.isEmpty ||
        descriptionAr.isEmpty) {
      ToastMessages.showError("Some data is missing");

      return false;
    }
    if (id == 0 && image1 == null) {
      ToastMessages.showError("Some data is missing");

      return false;
    }
    return true;
  }

  @override
  void initState() {
    setState(() {
      id = widget.service.id;
      imagePath = imageBaseUrl + widget.service.image;

      price = widget.service.charges;
      descriptionEn = widget.service.descriptionEn;
      descriptionAr = widget.service.descriptionAr;
      time = widget.service.time.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(title: "Update Service"),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: GetX<ServiceController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 10,
              // ),
              // SingleSelectionSimpleDropDown(
              //     title: "General Service",
              //     validator: isValidate && service == 0 ? "required" : "",
              //     onChange: (DropDown val) {
              //       setState(() {
              //         service = val.value;
              //       });
              //     },
              //     selected: 0,
              //     items: constantController.generalServices
              //         .map((element) =>
              //             DropDown(title: element.nameEn, value: element.id))
              //         .toList()),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: SimpleInputField(
                      keyBoardType: TextInputType.number,
                      title: "Charges",
                      hint: "writeHere".tr,
                      initialValue: price,
                      validator:
                          isValidate && price.isEmpty ? "required".tr : "",
                      onTextChange: (val) {
                        setState(() {
                          price = val;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: SimpleInputField(
                      keyBoardType: TextInputType.number,
                      title: "Estimated Time",
                      hint: "writeHere".tr,
                      initialValue: time,
                      validator:
                          isValidate && time.isEmpty ? "required".tr : "",
                      onTextChange: (val) {
                        setState(() {
                          time = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleInputField(
                title: "description(EN)".tr,
                hint: "writeHere".tr,
                initialValue: descriptionEn,
                validator:
                    isValidate && descriptionEn.isEmpty ? "required".tr : "",
                onTextChange: (val) {
                  setState(() {
                    descriptionEn = val;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleInputField(
                title: "description(AR)".tr,
                hint: "writeHere".tr,
                initialValue: descriptionAr,
                validator:
                    isValidate && descriptionAr.isEmpty ? "required".tr : "",
                onTextChange: (val) {
                  setState(() {
                    descriptionAr = val;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              customImagePicker(
                hint: '',
                width: width,
                validator: isValidate && image1 == null && id == 0
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
                    title: "Update",
                    onPress: () async {
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
                      var res = await controller.updateService(
                          service: service,
                          id: id,
                          descriptionEn: descriptionEn,
                          price: price,
                          descriptionAr: descriptionAr,
                          time: time,
                          image: image1);
                      if (res != null) {
                        var response = generalResponseFromJson(res);
                        // inspect(response);
                        if (response.status == 1) {
                          ToastMessages.showSuccess(
                              "Employee has been updated successfully");
                          Get.back();
                          controller.fetchServices();
                        } else {
                          ToastMessages.showError(
                              "Something went wrong. Please try again");
                        }
                      } else {
                        ToastMessages.showError(
                            "Something went wrong. Please try again");
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
              child: image.path.isNotEmpty
                  ? Image.file(
                      File(image.path),
                      fit: BoxFit.contain,
                    )
                  : Image.network(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
            ),
          ],
        ));
  }
}
