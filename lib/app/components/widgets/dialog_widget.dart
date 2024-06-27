// ignore_for_file: non_constant_identifier_names

import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void DialogLoading() {
  Get.dialog(
      WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.white, size: 50),
                const SizedBox(
                  height: 40,
                ),
                TextDefault(
                  message: "Tunggu Sebentar...",
                  colorText: Colors.white,
                )
              ],
            ),
          )),
      barrierDismissible: false);
}
