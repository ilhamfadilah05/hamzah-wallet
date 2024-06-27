// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_if_null_operators

import 'package:flutter/services.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  FormWidget(
      {super.key,
      required this.controller,
      this.title,
      this.hintText,
      this.keyboardType,
      this.obscure,
      this.obsTap,
      this.onChanged,
      this.errorForm,
      this.errorFormMessage,
      this.formatInput,
      this.radius,
      this.maxLines,
      this.isDisabled});

  TextEditingController controller;
  String? title;
  String? hintText;
  TextInputType? keyboardType;
  bool? obscure;
  Function()? obsTap;
  Function(String)? onChanged;
  bool? errorForm;
  String? errorFormMessage;
  List<TextInputFormatter>? formatInput;
  BorderRadiusGeometry? radius;
  int? maxLines;
  bool? isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDefault(message: title!),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: radius ?? BorderRadius.circular(5),
              border: Border.all(
                  color: errorForm == null
                      ? Colors.grey.withOpacity(0.3)
                      : errorForm == true
                          ? Colors.red
                          : Colors.grey.withOpacity(0.3))),
          child: TextFormField(
            controller: controller,
            inputFormatters: formatInput,
            readOnly: isDisabled ?? false,
            keyboardType:
                keyboardType == null ? TextInputType.text : keyboardType,
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 14,
            ),
            obscureText: obscure ?? false,
            onChanged: onChanged,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
                hintText: hintText ?? '',
                hintStyle: TextStyle(
                    fontFamily: 'poppins', fontSize: 14, color: Colors.grey),
                border: InputBorder.none,
                suffixIcon: obscure == null
                    ? null
                    : obscure == true
                        ? InkWell(
                            onTap: obsTap,
                            child: Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            ),
                          )
                        : InkWell(
                            onTap: obsTap,
                            child: Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          )),
          ),
        ),
        errorForm == null ||
                errorFormMessage == null ||
                errorForm == false ||
                errorFormMessage == ''
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        color: Colors.red,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextDefault(
                        message: errorFormMessage!,
                        colorText: Colors.red,
                        fontSize: 12,
                      ))
                    ],
                  )
                ],
              )
      ],
    );
  }
}
