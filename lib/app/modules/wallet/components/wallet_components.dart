// ignore_for_file: prefer_const_constructors

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/widgets/button_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/form_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:icons_plus/icons_plus.dart';

bottomSheetAddWallet() {
  final controller = Get.put(WalletController());
  Get.bottomSheet(Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDefault(
                  message: "Add Wallet",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(19)),
                        child: Icon(
                          Iconsax.wallet_2_bold,
                          size: 100,
                          color: controller.colorsInitialWallet.value,
                        ),
                      ),
                    ),
                    TextDefault(message: "Choose Color:"),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(controller.listColots.length,
                            (index) {
                          return InkWell(
                            onTap: () {
                              controller.changeColorWallet(
                                  controller.listColots[index]);
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.listColots[index]),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormWidget(
                      controller: controller.nameWalletTC,
                      title: 'Name',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormWidget(
                      controller: controller.noRekWalletTC,
                      title: 'No. Rekening',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextDefault(message: "Saldo"),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: TextDefault(message: "Rp"),
                        ),
                        Expanded(
                          child: FormWidget(
                            controller: controller.saldokWalletTC,
                            keyboardType: TextInputType.number,
                            radius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            onChanged: (p0) {
                              // controller.onChangeNominalTrx(p0);
                            },
                            formatInput: [
                              CurrencyTextInputFormatter(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: '',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Button(
                      action: () {
                        controller.tapCreateWallet();
                      },
                      message: "Create Wallet",
                      colorBtn: purpleDefault,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )));
}
