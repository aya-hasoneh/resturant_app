import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/details_controller.dart';
import 'package:task/model/items.dart';
import 'package:task/utls/colors.dart';

DetailsController controller = Get.put(DetailsController());
Widget containerListViewCartPage(index, context, Items items) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
    child: Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: CustomColor.purpleColor.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(File(items.path)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Text(
                    items.itemName,
                    style:
                        TextStyle(color: CustomColor.purpleColor, fontSize: 15),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: GetBuilder<DetailsController>(
                      init: controller,
                      builder: (_) {
                        return Text(
                          "Price: JD " + items.itemPrice,
                          style: TextStyle(
                              color: CustomColor.blueColor, fontSize: 15),
                        );
                      },
                    )),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                  onPressed: () {
                    controller.deleteItemsFromCart(index, items);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
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
                    size: 20,
                  )),
              GetBuilder<DetailsController>(
                  init: controller,
                  builder: (_) {
                    return Text(items.qty.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: CustomColor.blueColor,
                        ));
                  }),
              IconButton(
                  onPressed: () {
                    controller.addQtyItems(items);
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: CustomColor.purpleColor,
                    size: 20,
                  )),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Text(
                  "Total : " +
                      (items.qty * double.parse(items.itemPrice))
                          .toStringAsFixed(1),
                  style: TextStyle(color: CustomColor.blueColor, fontSize: 15),
                ),
              )
            ],
          ),
        )
      ]),
    ),
  );
}
