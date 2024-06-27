// ignore_for_file: must_be_immutable

import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(
      {super.key,
      this.action,
      this.colorBtn,
      this.colorText,
      this.width,
      this.heigth,
      this.variant,
      this.margin,
      this.radius,
      this.bgOutlined,
      required this.message});
  VoidCallback? action;
  Color? colorBtn;
  Color? colorText;
  double? width;
  Color? bgOutlined;
  double? heigth;
  double? radius;
  String message;
  String? variant;
  EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.white,
      hoverColor: Colors.white,
      splashColor: Colors.white,
      highlightColor: Colors.white,
      onTap: action,
      child: Container(
        width: width,
        height: heigth,
        margin: margin,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: variant == 'outlined'
                ? bgOutlined ?? Colors.white
                : colorBtn ?? blueDefault,
            border: Border.all(
                color: variant == 'outlined'
                    ? colorBtn ?? blueDefault
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(radius ?? 5)),
        child: Center(
          child: TextDefault(
            message: message,
            colorText: colorText ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
