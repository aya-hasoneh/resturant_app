import 'package:get/get.dart';
import 'package:task/model/items.dart';
import 'package:task/routes/app_links/links.dart';
import 'package:task/view/admin/home_admin_screen.dart';
import 'package:task/view/customer/cart_screen.dart';
import 'package:task/view/customer/details_screen.dart';
import 'package:task/view/customer/main_screen.dart';
import 'package:task/view/customer/register_screen.dart';
import 'package:task/view/customer/login_screen.dart';

class AppRoutes {
  final pages = [
    GetPage(
      name: AppLinks().loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppLinks().mainPage,
      page: () {
        return MainPage();
      },
    ),
    GetPage(name: AppLinks().registerPage, page: () => const RegisterPage()),
    GetPage(
        name: AppLinks().detailsPage,
        page: () {
          Items items = Get.arguments;
          return DetailsPage(
            items: items,
          );
        },
        fullscreenDialog: true),
    GetPage(
        name: AppLinks().cartPage,
        page: () {
          return CartPage();
        }),
    GetPage(
        name: AppLinks().adminPage,
        page: () {
          return HomeAdminPage();
        }),
  ];
}
