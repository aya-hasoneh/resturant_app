import 'package:flutter/material.dart';
import 'package:task/utls/colors.dart';

class SharedButton extends StatelessWidget {
  String titleButton;
  VoidCallback onTap;
  SharedButton({Key? key, required this.titleButton,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          titleButton,
          style: TextStyle(
              color: CustomColor.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        )),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              colors: [CustomColor.purpleColor, CustomColor.blueColor]),
        ),
      ),
    );
  }
}
