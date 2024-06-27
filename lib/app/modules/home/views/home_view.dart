// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/modules/home/components/header_home_component.dart';
import 'package:hamzah_wallet/app/modules/transactions/widgets/list_transaction_widget.dart';
import 'package:hamzah_wallet/app/modules/transactions/controllers/transactions_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderHome(
                controller: controller,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDefault(
                  message: "Transactions",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                TextDefault(
                  message: "See All",
                  colorText: Colors.grey,
                )
              ],
            ),
          ),
          ListTransactions(controller: Get.put(TransactionsController()))
        ],
      ),
    );
  }
}
