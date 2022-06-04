import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/login_controller.dart';
import 'package:task/main.dart';
import 'package:task/routes/app_links/links.dart';
import 'package:task/utls/colors.dart';
import 'package:task/widget/button_widget.dart';

import '../../utls/Device.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  LoginController controller = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Device.height = MediaQuery.of(context).size.height;
    Device.width = MediaQuery.of(context).size.width;
    print("Device width = ${Device.width}");

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: Device.width / 4),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Device.width * 0.05, left: Device.width * 0.05),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: Device.width * 0.12,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.purpleColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Device.width * 0.06,
                  left: Device.width * 0.05,
                  right: Device.width * 0.05),
              child: Form(
                key: controller.formkey,
                child: Column(children: [
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: CustomColor.purpleColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: CustomColor.purpleColor, width: 2),
                      ),
                    ),
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                  ),
                  SizedBox(
                    height: Device.width * 0.025,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: CustomColor.purpleColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: CustomColor.purpleColor, width: 2),
                      ),
                    ),
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: Device.width * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(top: Device.width * 0.05),
              child: Center(
                child: SharedButton(
                  titleButton: "Login",
                  onTap: () {
                    controller.checkLogin();
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 5,
                  left: Device.width * 0.06,
                  right: Device.width * 0.06),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppLinks().registerPage);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: CustomColor.whiteColor,
                            fontSize: Device.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: Device.width * 0.12,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          CustomColor.purpleColor,
                          CustomColor.blueColor,
                        ])),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ))),
    );
  }
}
