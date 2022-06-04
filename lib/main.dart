import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/model/items.dart';
import 'package:task/routes/app_links/links.dart';
import 'package:task/routes/app_routes/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/utls/Device.dart';

SharedPreferences? sharedPref;
var email = sharedPref!.getString('email');
var isAdmin = sharedPref!.getString('isAdmin') ?? false;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPref = await SharedPreferences.getInstance();
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(ItemsAdapter());
  // Opening the box
  await Hive.openBox<Items>('items');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: email == null
          ? AppLinks().loginPage
          : email == "admin@admin.com"
              ? AppLinks().adminPage
              : AppLinks().mainPage,
      getPages: AppRoutes().pages,
    );
  }
}
