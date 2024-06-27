// ignore_for_file: unnecessary_overrides

import 'package:hamzah_wallet/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  var logoSplashscreen = 'assets/images/splashscreen/splashscreen_logo.png'.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var token = storage.getString('idUser') ?? '';
    if (token == '') {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.toNamed(Routes.AUTHENTICATION_LOGIN);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.toNamed(Routes.HOME);
      });
    }
  }
}
