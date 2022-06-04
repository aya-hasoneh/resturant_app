import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/controller/home_admin_controller.dart';
import 'package:task/database/boxes.dart';
import 'package:task/main.dart';
import 'package:task/model/items.dart';
import 'package:task/routes/app_links/links.dart';
import 'package:task/utls/colors.dart';
import 'package:task/view/admin/add.dart';
import 'package:task/widget/home_widget/tile_widget.dart';

class HomeAdminPage extends StatelessWidget {
  HomeAdminPage({Key? key}) : super(key: key);
  HomeAdminController controller = Get.put(HomeAdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                addInShowDiologBox(context);
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                sharedPref!.clear();
                Get.toNamed(AppLinks().loginPage);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
          title: const Text("Resturant"),
          leading: Container(),
          elevation: 0,
          backgroundColor: CustomColor.purpleColor,
        ),
        body: ValueListenableBuilder<Box<Items>>(
            valueListenable: ItemBox.getItems().listenable(),
            builder: (context, box, _) {
              final items = box.values.toList().cast<Items>();
              if (items.isEmpty) {
                return const Center(
                  child: Text(
                    'No item yet!',
                    style: TextStyle(fontSize: 24),
                  ),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: 400,
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return tile(context, index, item, showIcons: true);
                      }),
                );
              }
            }));
  }
}
