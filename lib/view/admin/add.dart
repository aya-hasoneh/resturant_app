import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/home_admin_controller.dart';
import 'package:task/utls/colors.dart';
import 'package:task/widget/textfeild.dart';

HomeAdminController controller = Get.put(HomeAdminController());

Future addInShowDiologBox(context) {
  return Get.defaultDialog(
      title: "Add Your Item",
      content: Form(
          key: controller.itemFormKey,
          child: SingleChildScrollView(
            child: Column(children: [
              CustomTextFeild(
                isThereMaxLength: true,
                hint: "Enter item name",
                isValid: true,
                controller: controller.itemNameController,
              ),
              CustomTextFeild(
                isThereMaxLength: false,
                hint: "Enter item price",
                isValid: true,
                controller: controller.itemPriceController,
              ),
              IconButton(
                  onPressed: () {
                    controller.getImage();
                  },
                  icon: Icon(
                    Icons.add_a_photo,
                    color: CustomColor.purpleColor,
                  )),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    controller.onTapAddButton();
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "Add",
                      style: TextStyle(color: CustomColor.whiteColor),
                    )),
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        CustomColor.purpleColor,
                        CustomColor.blueColor
                      ]),
                    ),
                  ))
            ]),
          )));
}
