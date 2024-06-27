// ignore_for_file: unnecessary_overrides

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/widgets/alert_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/dialog_widget.dart';
import 'package:hamzah_wallet/app/helpers/endpoint.dart';
import 'package:hamzah_wallet/app/routes/app_pages.dart';
import 'package:hamzah_wallet/app/services/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationLoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obsPassword = true.obs;
  var errorEmail = false.obs;
  var errorPassword = false.obs;
  var messageErrorEmail = ''.obs;
  var messageErrorPassword = ''.obs;
  var rememberMe = false.obs;
  var boolButtonEnable = false.obs;

  @override
  void onInit() {
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

  void obsPasswordTap() {
    obsPassword.value = !obsPassword.value;
  }

  void rememberMeTap() {
    rememberMe.value = !rememberMe.value;
  }

  void onChangeForm(String value, String type) {
    if (type == 'email') {
      if (value == '') {
        errorEmail.value = true;
        messageErrorEmail.value = 'Email cannot be empty!';
        boolButtonEnable.value = false;
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        errorEmail.value = true;
        messageErrorEmail.value = 'Email not valid!';
        boolButtonEnable.value = false;
      } else {
        errorEmail.value = false;
        messageErrorEmail.value = '';
        if (errorEmail.value == false && errorPassword.value == false) {
          boolButtonEnable.value = true;
        }
      }
    } else {
      if (value == '') {
        errorPassword.value = true;
        messageErrorPassword.value = 'Password cannot be empty!';
        boolButtonEnable.value = false;
      } else if (value.length < 8) {
        errorPassword.value = true;
        messageErrorPassword.value = 'Password not valid!';
        boolButtonEnable.value = false;
      } else {
        errorPassword.value = false;
        messageErrorPassword.value = '';
        if (errorEmail.value == false && errorPassword.value == false) {
          boolButtonEnable.value = true;
        }
      }
    }
  }

  void tapSignIn() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    if (boolButtonEnable.value) {
      DialogLoading();
      FirebaseServices()
          .fetchDataByFilter(
              endpoint: EndpointFirebase.USER,
              key: 'email',
              value: emailController.text)
          .then((value) {
        if (value.isEmpty) {
          boolButtonEnable.value = false;
          Get.back();
          AlertSnackbar('error', 'error', 'Account not found!');
        } else {
          var dataUser = value[0];
          var passwordHash = utf8.decode(base64.decode(dataUser!['password']));
          if (dataUser['email'] == emailController.text &&
              passwordHash == passwordController.text) {
            AlertSnackbar('success', 'success', 'Login Successfully');
            storage.setString('idUser', dataUser.id);
            Get.offAllNamed(Routes.HOME);
          } else {
            boolButtonEnable.value = false;
            Get.back();
            AlertSnackbar('error', 'error', 'Email or Password wrong!');
          }
        }
      }).catchError((e) {
        boolButtonEnable.value = false;
        Get.back();
        AlertSnackbar('error', 'error', 'Account not found!');
      });
    }
  }
}
