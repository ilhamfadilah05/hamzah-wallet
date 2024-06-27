// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/modules/transactions/widgets/list_transaction_widget.dart';
import 'package:hamzah_wallet/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:icons_plus/icons_plus.dart';

class TransactionsView extends GetView<TransactionsController> {
  const TransactionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: purpleDefault,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextDefault(
              message: "Transactions",
              colorText: Colors.white,
              fontSize: 20,
            ),
            InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  controller.viewBottomSheetAddTransaction();
                },
                child: Icon(Iconsax.add_outline))
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          ListTransactions(controller: controller),
        ],
      )),
    );
  }
}
