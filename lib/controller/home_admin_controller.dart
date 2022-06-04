import 'dart:io';
//import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:task/database/boxes.dart';
import 'package:task/model/items.dart';

class HomeAdminController extends GetxController {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  final itemFormKey = GlobalKey<FormState>();

  @override
  void onClose() {
    Hive.box("items").close();
    super.onClose();
  }

  ImagePicker image = ImagePicker();
  File? file;
  late String path;
  getImage() async {
    var imageFile = await image.pickImage(source: ImageSource.gallery);
    file = File(imageFile!.path);
    path = file!.path;
    final appDir = await syspaths.getApplicationDocumentsDirectory();

    String fileName = imageFile.path.split('/').last;
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
    print(fileName);
  }

  Future addItem(String name, String price, String path) async {
    final items = Items(
      itemName: name,
      itemPrice: price,
      path: path,
    )
      ..itemName = name
      ..itemPrice = price
      ..path = path;

    final box = ItemBox.getItems();
    box.add(items);
    print("add info to the box");
  }

  void deleteItems(Items items) {
    items.delete();
  }

  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  onTapAddButton() {
    if (itemFormKey.currentState!.validate()) {
      print(path.toString());
      addItem(
          itemNameController.text, itemPriceController.text, path.toString());
      itemNameController.clear();
      itemPriceController.clear();
      path = "";
      Get.back();
    }
  }
}
