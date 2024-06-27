import 'package:flutter/material.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingWidget({double? height}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height ?? 0,
        ),
        LoadingAnimationWidget.fourRotatingDots(color: purpleDefault, size: 50),
        const SizedBox(
          height: 20,
        ),
        TextDefault(
          message: "Loading..",
          colorText: Colors.grey,
        )
      ],
    ),
  );
}
