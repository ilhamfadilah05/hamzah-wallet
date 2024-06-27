// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/widgets/loading_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/modules/wallet/components/wallet_components.dart';
import 'package:hamzah_wallet/app/modules/wallet/widgets/list_wallet_widget.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: purpleDefault,
            elevation: 1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDefault(
                  message: "Wallet",
                  colorText: Colors.white,
                  fontSize: 20,
                ),
                InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      bottomSheetAddWallet();
                    },
                    child: Icon(Iconsax.add_outline))
              ],
            ),
            centerTitle: true,
          ),
          body: controller.isLoading.value
              ? loadingWidget()
              : ListWalletWidget(controller: controller));
    });
  }
}
