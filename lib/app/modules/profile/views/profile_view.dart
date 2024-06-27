// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/widgets/button_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/loading_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: purpleDefault,
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextDefault(
                message: "Profile",
                colorText: Colors.white,
                fontSize: 20,
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: controller.isLoading.value
            ? loadingWidget(height: Get.height / 4)
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: purpleDefault.withOpacity(0.2),
                                      blurRadius: 10)
                                ]),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      controller.dataUser.value.profileImage!,
                                  width: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextDefault(
                                      message: controller.dataUser.value.name!,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextDefault(
                                      message: controller.dataUser.value.email!,
                                      colorText: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextDefault(
                            message: "Settings",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextDefault(message: "About Us"),
                                Icon(Icons.navigate_next)
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextDefault(message: "Pictures"),
                                Icon(Icons.navigate_next)
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Button(
                    message: "Logout",
                    action: () {},
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    colorBtn: Colors.red,
                  )
                ],
              )));
  }
}
