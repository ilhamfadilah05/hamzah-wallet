// ignore_for_file: unnecessary_overrides, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/widgets/alert_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/dialog_widget.dart';
import 'package:hamzah_wallet/app/helpers/endpoint.dart';
import 'package:hamzah_wallet/app/modules/transactions/components/transaction_component.dart';
import 'package:hamzah_wallet/app/services/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class WalletController extends GetxController {
  var dataWallet = [].obs;
  var isLoading = true.obs;
  final nameWalletTC = TextEditingController();
  final noRekWalletTC = TextEditingController();
  final saldokWalletTC = TextEditingController();
  var listColots = [
    Colors.amber,
    Colors.blue,
    Colors.cyan,
    Colors.red,
    Colors.green,
    Colors.orange,
  ].obs;

  var colorsInitialWallet = Colors.grey.obs;

  void init() {
    fetchDataWallet();
  }

  void disposeWallet() {
    nameWalletTC.text = '';
    noRekWalletTC.text = '';
    saldokWalletTC.text = '';
  }

  void fetchDataWallet() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    FirebaseServices()
        .fetchDataByFilter(
            endpoint: EndpointFirebase.WALLET,
            key: 'id_user',
            value: storage.getString('idUser') ?? '')
        .then((value) {
      if (value.isEmpty) {
        dataWallet.value = [];
        isLoading.value = false;
        // AlertSnackbar('error', 'error',
        //     "There seems to be an error, please try again later.",
        //     position: SnackPosition.TOP);
        return null;
      } else {
        dataWallet.value = value;
        isLoading.value = false;
        return value;
      }
    });
  }

  void changeColorWallet(MaterialColor color) {
    colorsInitialWallet.value = color;
  }

  void tapCreateWallet() {
    if (nameWalletTC.text != '' &&
        noRekWalletTC.text != '' &&
        saldokWalletTC.text != '') {
      Get.back();
      bottomSheetDialogMakeSure(
        message: "Are you sure you want to make this wallet?",
        onTap: () {
          Get.back();
          createWallet();
        },
      );
    } else {
      AlertSnackbar('error', 'Upppsss!', 'All data cannot be empty',
          position: SnackPosition.TOP);
    }
  }

  void createWallet() async {
    DialogLoading();
    SharedPreferences storage = await SharedPreferences.getInstance();
    var id = Uuid().v4();
    var dataMap = {
      'id': id,
      'name': nameWalletTC.text,
      'id_user': storage.getString('idUser'),
      'no_rek': noRekWalletTC.text,
      'saldo': int.parse(saldokWalletTC.text.replaceAll('.', '')),
      'color': colorsInitialWallet.value.value.toRadixString(16),
      'created_at': DateTime.now().toString()
    };
    FirebaseServices()
        .postData(endpoint: EndpointFirebase.WALLET, data: dataMap, id: id);

    Get.back();
    AlertSnackbar('success', "Success", 'Add Wallet Successfully');
    disposeWallet();
    fetchDataWallet();
  }
}
