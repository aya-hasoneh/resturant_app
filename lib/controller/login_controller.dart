import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/main.dart';
import 'package:task/routes/app_links/links.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var email = "";
  var password = "";

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onInit();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return " Enter Your Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length <= 7) {
      return "Password must be 7 character";
    }
    return null;
  }

  checkLogin() {
    if (email == "admin@admin.com" && password == "admin12") {
      sharedPref!.setString("email", email);
      Get.toNamed(AppLinks().adminPage);
    }
    final isValid = formkey.currentState!.validate();

    if (isValid) {
      sharedPref!.setString("email", email);

      Get.toNamed(AppLinks().mainPage);
    }

    formkey.currentState!.save();
  }
}
