import 'dart:io';

import 'package:hive/hive.dart';
part 'items.g.dart';

@HiveType(typeId: 0)
class Items extends HiveObject {
  @HiveField(0)
  late String itemName;
  @HiveField(1)
  late String itemPrice;
   @HiveField(2)
   int qty = 1;
   @HiveField(3)
  String path;
  
   Items({required this.itemName, required this.itemPrice,
  required this.path
   });
  
}
