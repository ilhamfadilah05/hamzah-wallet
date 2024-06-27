import 'package:get/get.dart';

import 'package:hamzah_wallet/app/modules/home/controllers/navbar_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
