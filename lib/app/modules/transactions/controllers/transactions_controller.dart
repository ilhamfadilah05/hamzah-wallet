// ignore_for_file: unnecessary_overrides, unnecessary_string_interpolations, prefer_const_constructors, unnecessary_null_comparison, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/others/currency_format.dart';
import 'package:hamzah_wallet/app/components/widgets/alert_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/dialog_widget.dart';
import 'package:hamzah_wallet/app/helpers/endpoint.dart';
import 'package:hamzah_wallet/app/modules/home/controllers/navbar_controller.dart';
import 'package:hamzah_wallet/app/modules/transactions/components/transaction_component.dart';
import 'package:hamzah_wallet/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:hamzah_wallet/app/services/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class TransactionsController extends GetxController {
  var title = 'Transactions'.obs;

  var dataTransactions = [].obs;
  var isLoading = true.obs;
  var listPriceTransactions =
      [5000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000, 2000000].obs;

  final nominalTrxText = TextEditingController();
  var nominalText = ''.obs;
  var listTypeTrx = ['-- Pilih --', 'Kredit', 'Debit'].obs;
  var typeTrx = ''.obs;
  var listWallet = [].obs;
  var dataWallet = {}.obs;
  var descriptionTrx = ''.obs;

  void init() {
    fetchDataTransaction();
  }

  void viewBottomSheetAddTransaction() {
    Get.put(WalletController()).fetchDataWallet();
    bottomSheetAddTransaction(Get.put(WalletController()).dataWallet);
  }

  void fetchDataTransaction() async {
    if (Get.put(NavbarController().selectedIndex.value == 0)) {
      FirebaseServices()
          .fetchAllData(endpoint: EndpointFirebase.TRANSACTION)
          .then((value) {
        if (value == null) {
          isLoading.value = false;
          dataTransactions.value = [];
        } else {
          dataTransactions.value = value;
          isLoading.value = false;
        }
      });
    } else {
      FirebaseServices()
          .fetchAllData(endpoint: EndpointFirebase.TRANSACTION)
          .then((value) {
        if (value == null) {
          isLoading.value = false;
          dataTransactions.value = [];
        } else {
          dataTransactions.value = value;
          isLoading.value = false;
        }
      });
    }
  }

  void tapNominalOptions(int nominal) {
    nominalTrxText.text = '${CurrencyFormat.convertToIdr(nominal, 0)}';
    nominalText.value = '${CurrencyFormat.convertToIdr(nominal, 0)}';
  }

  void onChangeNominalTrx(String nominal) {
    nominalText.value = '$nominal';
  }

  void onChangeTypeTrx(String type) {
    typeTrx.value = type;
  }

  void onChangeWalletTrx(String id, String name) {
    dataWallet.value = {'id': id, 'name': name};
  }

  void onChangeDesc(String desc) {
    descriptionTrx.value = desc;
  }

  void tapAddTransaction() {
    if (nominalText.value == '') {
      AlertSnackbar('error', 'Error', 'Nominal cannot be empty!',
          position: SnackPosition.TOP);
    } else if (typeTrx.value == '' || typeTrx.value == '-- Pilih --') {
      AlertSnackbar('error', 'Error', 'Type cannot be empty!',
          position: SnackPosition.TOP);
    } else if (dataWallet.isEmpty || dataWallet['id'] == '') {
      AlertSnackbar('error', 'Error', 'Wallet cannot be empty!',
          position: SnackPosition.TOP);
    } else {
      Get.back();
      bottomSheetDialogMakeSure(
        message: "Are you sure you want to make this transaction?",
        onTap: () {
          Get.back();
          addTransaction();
        },
      );
    }
  }

  void addTransaction() async {
    DialogLoading();
    SharedPreferences storage = await SharedPreferences.getInstance();
    var id = Uuid().v4();

    var mapData = {
      'id': id,
      'id_user': storage.getString('idUser'),
      'id_wallet': dataWallet['id'],
      'name_wallet': dataWallet['name'],
      'message': descriptionTrx.value,
      'price': int.parse(nominalText.value.replaceAll('.', '')),
      'type': typeTrx.value,
      'created_at': DateTime.now().toString()
    };

    FirebaseServices().postData(
        endpoint: EndpointFirebase.TRANSACTION, data: mapData, id: id);

    Get.back();
    AlertSnackbar('success', "Success", 'Add Transaction Successfully');
    typeTrx.value = '';
    nominalText.value = '';
    nominalTrxText.text = '';
    fetchDataTransaction();
  }
}
