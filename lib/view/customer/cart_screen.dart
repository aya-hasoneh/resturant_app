import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/details_controller.dart';
import 'package:task/utls/colors.dart';
import 'package:task/widget/appbar.dart';
import 'package:task/widget/button_widget.dart';
import 'package:task/widget/cart_widget/container_listview_cartpage.dart';

class CartPage extends StatelessWidget {
  DetailsController dcontroller = Get.put(DetailsController());

  String title;
  CartPage({
    Key? key,
    this.title = "Resturant",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          AppBarWidget(
            showBackButton: false,
            onTap: () {},
          ),
          GetBuilder<DetailsController>(
              init: dcontroller,
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    height: 333,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                        controller: PageController(
                            initialPage: 0, viewportFraction: 0.8),
                        itemCount: dcontroller.cartItemsList.length,
                        itemBuilder: (context, index) {
                          var listItems = dcontroller.cartItemsList[index];
                          return Container(
                              child: containerListViewCartPage(
                                  index, context, listItems));
                        }),
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(top: 85, left: 30),
            child: Row(
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                      color: CustomColor.purpleColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GetBuilder<DetailsController>(
                        init: controller,
                        builder: (_) {
                          return Text(
                            controller.getBillTotal(),
                            style: TextStyle(
                                color: CustomColor.blueColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          );
                        }))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SharedButton(
              titleButton: "Check out",
              onTap: () {},
            ),
          ),
        ]),
      ),
    );
  }
}
