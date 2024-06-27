// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextDefault extends StatelessWidget {
  TextDefault(
      {super.key,
      required this.message,
      this.textAlign,
      this.textOverflow,
      this.maxLines,
      this.selectionColor,
      this.fontSize,
      this.fontWeight,
      this.colorText,
      this.styleText,
      this.fontFamily,
      this.underline});
  String message;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLines;
  Color? selectionColor;
  double? fontSize;
  FontWeight? fontWeight;
  Color? colorText;
  TextDecoration? underline;
  FontStyle? styleText;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: textAlign ?? TextAlign.left,
      overflow: textOverflow ?? TextOverflow.clip,
      maxLines: maxLines ?? 100,
      // selectionColor: selectionColor ?? Colors.blue[200],
      style: TextStyle(
          fontFamily: fontFamily ?? 'poppins',
          fontStyle: styleText ?? FontStyle.normal,
          fontSize: fontSize ?? 9.sp,
          color: colorText ?? Colors.black,
          decoration: underline ?? TextDecoration.none,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
