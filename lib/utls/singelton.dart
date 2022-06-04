import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/main.dart';
import 'package:task/routes/app_links/links.dart';
import 'package:task/utls/colors.dart';

class Singleton {
  static final Singleton prefrence = Singleton();
  final navBarItem = [
    Icon(Icons.home, size: 30, color: CustomColor.whiteColor),
    Icon(Icons.shopping_cart, size: 30, color: CustomColor.whiteColor),
    InkWell(
        onTap: () {
          sharedPref!.clear();
          Get.offAllNamed(AppLinks().loginPage);
        },
        child: Icon(Icons.logout, size: 30, color: CustomColor.whiteColor)),
  ];
}
