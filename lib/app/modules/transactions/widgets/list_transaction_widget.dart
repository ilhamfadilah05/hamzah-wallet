// ignore_for_file: prefer_const_constructors, unnecessary_cast, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/others/currency_format.dart';
import 'package:hamzah_wallet/app/components/widgets/loading_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/models/transaction_model.dart';
import 'package:hamzah_wallet/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class ListTransactions extends StatelessWidget {
  const ListTransactions({
    super.key,
    required this.controller,
  });

  final TransactionsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? loadingWidget(height: Get.height / 4)
          : controller.dataTransactions.isEmpty
              ? Container()
              : Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: List.generate(
                            controller.dataTransactions.length, (index) {
                          TransactionModel data = TransactionModel.fromJson(
                              '',
                              controller.dataTransactions[index].data()
                                  as Map<String, dynamic>);
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: purpleDefault.withOpacity(0.2),
                                    blurRadius: 10,
                                  )
                                ]),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Iconsax.wallet_1_bold,
                                          size: 40,
                                          color: data.type == 'Debit'
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextDefault(
                                                message:
                                                    '${data.type} - ${data.nameWallet}',
                                                fontSize: 16,
                                              ),
                                              TextDefault(
                                                message: "${data.message}",
                                                fontSize: 12,
                                                maxLines: 2,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                              ),
                                              TextDefault(
                                                message:
                                                    "${DateFormat("dd MMMM yyyy, HH:mm").format(data.createdAt!)}",
                                                fontSize: 12,
                                                colorText: Colors.grey,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextDefault(
                                  message:
                                      "${data.type == 'Debit' ? '+' : '-'} Rp ${CurrencyFormat.convertToIdr(data.price, 0)}",
                                  textAlign: TextAlign.end,
                                  fontSize: 16,
                                  colorText: data.type == 'Debit'
                                      ? Colors.green
                                      : Colors.red,
                                )
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  ));
    });
  }
}
