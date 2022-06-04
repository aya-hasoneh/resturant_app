import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/controller/home_admin_controller.dart';
import 'package:task/database/boxes.dart';
import 'package:task/model/items.dart';

import 'package:task/routes/app_links/links.dart';
import 'package:task/widget/appbar.dart';
import 'package:task/widget/home_widget/tile_widget.dart';

class HomePage extends StatelessWidget {
  HomeAdminController controller = Get.put(HomeAdminController());

  HomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBarWidget(
            onTap: () {
              Get.back();
            },
            showBackButton: false,
          ),
          ValueListenableBuilder<Box<Items>>(
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
                    height: MediaQuery.of(context).size.height - 200,
                    width: 500,
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return InkWell(
                              onTap: () {
                                Get.toNamed(AppLinks().detailsPage,
                                    arguments: Items(
                                        itemName: item.itemName,
                                        itemPrice: item.itemPrice,
                                        path: item.path));
                              },
                              child:
                                  tile(context, index, item, showIcons: false));
                        }),
                  );
                }
              })
        ],
      ),
    );
  }
}
