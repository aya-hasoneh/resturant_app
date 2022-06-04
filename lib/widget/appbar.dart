import 'package:flutter/material.dart';
import 'package:task/utls/colors.dart';

class AppBarWidget extends StatelessWidget {
  bool showBackButton;
  VoidCallback onTap;
  AppBarWidget({Key? key, this.showBackButton = true, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: CustomColor.purpleColor,
      leading: showBackButton
          ? IconButton(onPressed: onTap, icon: const Icon(Icons.arrow_back))
          : Container(),
      title: const Text("Resturant"),
    );
  }
}
