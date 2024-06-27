// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/others/currency_format.dart';
import 'package:hamzah_wallet/app/components/widgets/button_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/dropdown_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/form_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:sizer/sizer.dart';

void bottomSheetAddTransaction(List? dataWallet) {
  final controller = Get.put(TransactionsController());
  Get.bottomSheet(
    Obx(() {
      return Container(
        margin: EdgeInsets.only(top: Get.mediaQuery.size.height / 6),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextDefault(
                  message: controller.title.value,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.close),
                ),
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
                    TextDefault(message: "Nominal"),
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
                            controller: controller.nominalTrxText,
                            keyboardType: TextInputType.number,
                            radius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            onChanged: (p0) {
                              controller.onChangeNominalTrx(p0);
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
                      height: 10,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 50,
                      childAspectRatio: 2.0,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      children: List.generate(
                        controller.listPriceTransactions.length,
                        (index) {
                          var data = controller.listPriceTransactions[index];
                          return InkWell(
                            onTap: () {
                              controller.tapNominalOptions(data);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.nominalText.value
                                              .replaceAll('.', '') ==
                                          "${data}"
                                      ? purpleDefault
                                      : purpleDefault.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: TextDefault(
                                message:
                                    "Rp${CurrencyFormat.convertToIdr(data, 0)}",
                                colorText: controller.nominalText.value
                                            .replaceAll('.', '') ==
                                        "${data}"
                                    ? Colors.white
                                    : Colors.black,
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                    TextDefault(message: "Tipe"),
                    SizedBox(
                      height: 5,
                    ),
                    DropdownWidget(
                        listItems: controller.listTypeTrx,
                        value: controller.typeTrx.value,
                        onChanged: (value) {
                          controller.onChangeTypeTrx("${value}");
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextDefault(message: "Wallet"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonFormField(
                          items: dataWallet!.map((data) {
                            return DropdownMenuItem(
                                value: "${data['id']} ${data['name']}",
                                child: TextDefault(message: "${data['name']}"));
                          }).toList(),
                          decoration: InputDecoration(border: InputBorder.none),
                          onChanged: (e) {
                            var id = e!.split(" ")[0];

                            var name =
                                "${e.split(" ")[1]} ${e.split(" ").length > 1 ? e.split(" ")[2] : ''} ";

                            controller.onChangeWalletTrx(id, name);
                          }),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormWidget(
                      title: "Deskripsi",
                      controller: TextEditingController(),
                      maxLines: 5,
                      onChanged: (p0) {
                        controller.onChangeDesc(p0);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Button(
                      action: () {
                        controller.tapAddTransaction();
                      },
                      message: "Add Transaction",
                      colorBtn: purpleDefault,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }),
    isScrollControlled: true,
  );
}

void bottomSheetDialogMakeSure(
    {required String message,
    required Function() onTap,
    Function()? onTapClose}) {
  Get.dialog(Dialog(
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.close))
            ],
          ),
          Icon(
            Icons.warning_rounded,
            size: 80,
            color: Colors.amber,
          ),
          SizedBox(
            height: 20,
          ),
          TextDefault(
            message: message,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Button(
                      message: "No",
                      variant: 'outlined',
                      colorText: purpleDefault,
                      colorBtn: purpleDefault,
                      action: onTapClose ??
                          () {
                            Get.back();
                          }),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Button(
                  action: onTap,
                  message: "Yes",
                  colorBtn: purpleDefault,
                ))
              ],
            ),
          )
        ],
      ),
    ),
  ));
}
