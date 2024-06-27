import 'package:get/get.dart';

import '../controllers/authentication_login_controller.dart';

class AuthenticationLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationLoginController>(
      () => AuthenticationLoginController(),
    );
  }
}
