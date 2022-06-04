import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/details_controller.dart';
import 'package:task/model/items.dart';
import 'package:task/routes/app_links/links.dart';
import 'package:task/utls/colors.dart';
import 'package:task/widget/appbar.dart';
import 'package:task/widget/button_widget.dart';

class DetailsPage extends StatelessWidget {
  Items items;
  DetailsPage({
    Key? key,
    required this.items,
  }) : super(key: key);
  DetailsController controller = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    //items.qty = 1;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          AppBarWidget(
            onTap: () {
              Get.back();
            },
            showBackButton: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.purpleColor.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: FileImage(File(items.path)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      items.itemName,
                      style: TextStyle(
                        color: CustomColor.purpleColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "JD " + items.itemPrice,
                    style: TextStyle(
                      color: CustomColor.blueColor,
                      fontSize: 25,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Divider(
                      height: 6,
                      color: CustomColor.purpleColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        IconButton(
                            onPressed: () {
                              controller.removeQtyItems(items);
                            },
                            icon: Icon(
                              Icons.remove_circle,
                              color: CustomColor.purpleColor,
                              size: 25,
                            )),
                        GetBuilder<DetailsController>(
                            init: controller,
                            builder: (_) {
                              return Text(
                                items.qty.toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                  color: CustomColor.blueColor,
                                ),
                              );
                            }),
                        IconButton(
                            onPressed: () {
                              controller.addQtyItems(items);
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: CustomColor.purpleColor,
                              size: 25,
                            )),
                        Expanded(child: Container()),
                        Padding(
                            padding: const EdgeInsets.only(right: 70),
                            child: GetBuilder<DetailsController>(
                                init: controller,
                                builder: (_) {
                                  return Text(
                                    "Total:JD " +
                                        (items.qty *
                                                double.parse(items.itemPrice))
                                            .toStringAsFixed(1),
                                    style: TextStyle(
                                        color: CustomColor.blueColor,
                                        fontSize: 15),
                                  );
                                })),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SharedButton(
            titleButton: "Add to cart",
            onTap: () {
              controller.addOneItemsToCartList(items);
              Get.toNamed(AppLinks().cartPage,
                  arguments: (Items(
                      path: items.path,
                      itemName: items.itemName,
                      itemPrice: items.itemPrice)));
            },
          ),
        ],
      ),
    ));
  }
}
