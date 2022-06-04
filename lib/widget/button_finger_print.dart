import 'package:flutter/material.dart';
import 'package:task/utls/colors.dart';

class ButtonFingerPrint extends StatelessWidget {
  String textButton;
  VoidCallback onTap;
  ButtonFingerPrint({Key? key, required this.textButton, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [CustomColor.blueColor, CustomColor.purpleColor])),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(color: CustomColor.whiteColor, fontSize: 18),
            ),
          )),
    );
  }
}
