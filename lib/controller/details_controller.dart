import 'package:get/get.dart';
import 'package:task/model/items.dart';

class DetailsController extends GetxController {
  var cartItemsList = <Items>[];

  removeQtyItems(Items items) {
    if (items.qty < 1) {
      return;
    }
    items.qty--;
    update();
  }

  addQtyItems(Items items) {
    items.qty++;
    update();
  }

  addOneItemsToCartList(Items items) {
    if (cartItemsList.contains(items)) {
      items.qty++;
    } else {
      cartItemsList.add(items);
    }
    update();
  }

  deleteItemsFromCart(index, Items items) {
    items.qty = 0;
    cartItemsList.removeAt(index);
    update();
  }

  String getBillTotal() {
    double total = 0;
    for (Items items in cartItemsList) {
      total = total + (items.qty * double.parse(items.itemPrice));
    }
    return total.toStringAsFixed(2);
  }
}
