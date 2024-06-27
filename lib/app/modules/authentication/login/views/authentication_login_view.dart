// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/modules/authentication/login/components/form_login.dart';
import '../controllers/authentication_login_controller.dart';

class AuthenticationLoginView extends GetView<AuthenticationLoginController> {
  const AuthenticationLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteDefault,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInUp(
                  from: 100,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Image.asset('assets/images/login/login_logo.png')),
                ),
                SizedBox(
                  height: 40,
                ),
                FadeInUp(
                  from: 150,
                  child: TextDefault(
                    message: "Welcome Back!",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FadeInUp(
                  from: 200,
                  child: TextDefault(
                    message: 'Enter your email and password',
                    colorText: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FormLogin(
                  controller: controller,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
