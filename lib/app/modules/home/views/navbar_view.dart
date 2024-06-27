import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/modules/home/controllers/navbar_controller.dart';
import 'package:hamzah_wallet/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamzah_wallet/app/modules/profile/views/profile_view.dart';
import 'package:hamzah_wallet/app/modules/transactions/views/transactions_view.dart';
import 'package:hamzah_wallet/app/modules/wallet/views/wallet_view.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  final controller = Get.put(NavbarController());

  List<Widget> listWidget = [
    const HomeView(),
    const TransactionsView(),
    const WalletView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            body: listWidget.elementAt(controller.selectedIndex.value),
            bottomNavigationBar: WaterDropNavBar(
              backgroundColor: Colors.white,
              waterDropColor: purpleDefault,
              inactiveIconColor: purpleDefault.withOpacity(0.5),
              onItemSelected: (int index) {
                controller.selectedItemNavbar(index);
              },
              selectedIndex: controller.selectedIndex.value,
              barItems: <BarItem>[
                BarItem(
                  filledIcon: Iconsax.home_1_bold,
                  outlinedIcon: Iconsax.home_outline,
                ),
                BarItem(
                    filledIcon: Iconsax.transaction_minus_bold,
                    outlinedIcon: Iconsax.transaction_minus_outline),
                BarItem(
                  filledIcon: Iconsax.wallet_2_bold,
                  outlinedIcon: Iconsax.wallet_2_outline,
                ),
                BarItem(
                  filledIcon: Iconsax.profile_2user_bold,
                  outlinedIcon: Iconsax.profile_2user_outline,
                ),
              ],
            ),
          ),
        ));
  }
}
