import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/model/items.dart';

class ItemBox {
  static Box<Items> getItems() {
    return Hive.box<Items>("items");
  }
}
