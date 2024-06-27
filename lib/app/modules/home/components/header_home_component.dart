// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/others/currency_format.dart';
import 'package:hamzah_wallet/app/components/widgets/loading_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/modules/home/controllers/home_controller.dart';
import 'package:icons_plus/icons_plus.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? loadingWidget()
        : Stack(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                    color: purpleDefault,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(100)),
                    gradient: LinearGradient(colors: [
                      purpleDefault.withOpacity(0.8),
                      purpleDefault.withOpacity(0.9),
                      purpleDefault.withOpacity(0.7),
                      purpleDefault.withOpacity(0.8)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 46,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.2)),
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          "${controller.dataUser.value.profileImage}")),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextDefault(
                                    message: "Welcome Back",
                                    fontSize: 12,
                                    colorText: Colors.white,
                                  ),
                                  TextDefault(
                                    message: controller.dataUser.value.name!,
                                    colorText: Colors.white,
                                    fontSize: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                shape: BoxShape.circle),
                            child: Icon(
                              Iconsax.notification_bulk,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDefault(
                              message: "Your Balance",
                              colorText: Colors.white60,
                            ),
                            TextDefault(
                              message:
                                  "Rp. ${CurrencyFormat.convertToIdr(controller.dataUser.value.saldo, 0)}",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              colorText: Colors.white,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(Iconsax.add_outline),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextDefault(
                                      message: "Top Up",
                                      colorText: Colors.white,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(Bootstrap.currency_dollar),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextDefault(
                                      message: "Transfer",
                                      colorText: Colors.white,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Icon(Bootstrap.qr_code),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextDefault(
                                      message: "Qr Code",
                                      colorText: Colors.white,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
  }
}
