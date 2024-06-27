// ignore_for_file: non_constant_identifier_names

import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void AlertSnackbar(String tipe, String title, String message,
    {int durasi = 2000, SnackPosition position = SnackPosition.TOP}) {
  Get.snackbar("", "",
      snackPosition: position,
      duration: Duration(milliseconds: durasi),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      backgroundColor: tipe == "error"
          ? Colors.red.withOpacity(0.8)
          : tipe == "warning"
              ? Colors.amber
              : Colors.green,
      titleText: TextDefault(
        message: tipe == 'error' ? 'Ups !' : title,
        fontSize: 16,
        colorText: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      messageText: TextDefault(
        message: message,
        colorText: Colors.white,
      ));
}
