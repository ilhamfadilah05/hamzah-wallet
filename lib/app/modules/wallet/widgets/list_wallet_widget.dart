// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/others/convert_color.dart';
import 'package:hamzah_wallet/app/components/others/currency_format.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/models/wallet_model.dart';
import 'package:hamzah_wallet/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class ListWalletWidget extends StatelessWidget {
  const ListWalletWidget({
    super.key,
    required this.controller,
  });

  final WalletController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: List.generate(controller.dataWallet.length, (index) {
              WalletModel data =
                  WalletModel.fromJson('', controller.dataWallet[index].data());
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: purpleDefault.withOpacity(0.2),
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Iconsax.wallet_2_bold,
                      size: 40.sp,
                      color: HexColor(data.color!),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextDefault(
                                message: data.name!,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextDefault(
                                message: "(${data.noRek!})",
                                colorText: Colors.grey,
                              )
                            ],
                          ),
                          TextDefault(
                            message:
                                "Rp${CurrencyFormat.convertToIdr(data.saldo, 0)}",
                            fontSize: 11.sp,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
