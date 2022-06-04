import 'dart:io';

import 'package:flutter/material.dart';

import 'package:task/model/items.dart';
import 'package:task/utls/colors.dart';
import 'package:task/view/admin/add.dart';

Widget tile(context, index, Items items, {bool showIcons = false}) {
  return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
      child: Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(File(items.path)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Column(children: [
                    Text(
                      items.itemName,
                      style: TextStyle(
                        color: CustomColor.purpleColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "JD " + items.itemPrice,
                      style: TextStyle(
                        color: CustomColor.blueColor,
                        fontSize: 18,
                      ),
                    ),
                  ]),
                ),
                Expanded(child: Container()),
                showIcons
                    ? IconButton(
                        onPressed: () {
                          controller.deleteItems(items);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        ))
                    : Container(),
              //   showIcons
              //       ? IconButton(
              //           onPressed: () {
              //             Get.toNamed(AppLinks().editPage);
              //           },
              //           icon: const Icon(
              //             Icons.edit,
              //             color: Colors.blue,
              //             size: 25,
              //           ))
              //       : Container(),
               ],
            ),
          )));
}
