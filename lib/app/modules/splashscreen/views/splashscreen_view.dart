import 'package:animate_do/animate_do.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteDefault,
      body: Center(
          child: BounceInDown(
        from: 150,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child: Image.asset(controller.logoSplashscreen.value),
        ),
      )),
    );
  }
}
