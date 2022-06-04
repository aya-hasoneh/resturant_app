import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/home_admin_controller.dart';

class CustomTextFeild extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isValid;
  final bool isThereMaxLength;

  CustomTextFeild({
    Key? key,
    this.isThereMaxLength = true,
    required this.hint,
    required this.controller,
    required this.isValid,
  }) : super(key: key);
  HomeAdminController homeAdmincontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
          textInputAction: TextInputAction.done,
          maxLength: isThereMaxLength ? 22 : null,
          controller: controller,
          decoration: InputDecoration(
            labelText: hint,
            hintText: hint,
          ),
          validator: homeAdmincontroller.fieldValidator),
    );
  }
}
