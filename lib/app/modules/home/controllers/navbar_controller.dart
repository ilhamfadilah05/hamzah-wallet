// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/modules/home/controllers/home_controller.dart';
import 'package:hamzah_wallet/app/modules/profile/controllers/profile_controller.dart';
import 'package:hamzah_wallet/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:hamzah_wallet/app/modules/wallet/controllers/wallet_controller.dart';

class NavbarController extends GetxController {
  var selectedIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedIndex.value);
    Get.put(HomeController()).init();
    Get.put(TransactionsController()).init();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void selectedItemNavbar(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.put(HomeController()).init();
        break;
      case 1:
        Get.put(TransactionsController()).init();
        break;
      case 2:
        Get.put(WalletController()).init();
        break;
      case 3:
        Get.put(ProfileController()).init();
        break;
      default:
        Get.put(HomeController()).init();
        break;
    }
  }
}
