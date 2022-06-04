import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/main_controller.dart';
import 'package:task/routes/app_links/links.dart';
import 'package:task/utls/colors.dart';
import 'package:task/utls/singelton.dart';
import 'package:task/view/customer/cart_screen.dart';
import 'package:task/view/customer/home_screen.dart';
import 'package:task/view/customer/login_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({
    Key? key,
  }) : super(key: key);
  MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: CustomColor.purpleColor,
        backgroundColor: Colors.transparent,
        items: Singleton.prefrence.navBarItem,
        onTap: (index) {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        },
        key: controller.bottomNavigationKey,
      ),
      body: PageView(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        children: [HomePage(), CartPage(), Container()],
        controller: controller.pageController,
      ),
    );
  }
}
