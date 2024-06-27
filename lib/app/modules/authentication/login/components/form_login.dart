import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamzah_wallet/app/components/colors/color.dart';
import 'package:hamzah_wallet/app/components/widgets/button_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/form_widget.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';
import 'package:hamzah_wallet/app/modules/authentication/login/controllers/authentication_login_controller.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.controller,
  });

  final AuthenticationLoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            from: 300,
            child: FormWidget(
              controller: controller.emailController,
              title: 'Email',
              hintText: 'Enter your email',
              onChanged: (p0) {
                controller.onChangeForm(p0, 'email');
              },
              errorForm: controller.errorEmail.value,
              errorFormMessage: controller.messageErrorEmail.value,
            ),
          ),
         const SizedBox(
            height: 10,
          ),
          FadeInUp(
            from: 400,
            child: FormWidget(
              controller: controller.passwordController,
              title: 'Password',
              hintText: 'Enter your password',
              obscure: controller.obsPassword.value,
              obsTap: () {
                controller.obsPasswordTap();
              },
              onChanged: (p0) {
                controller.onChangeForm(p0, 'password');
              },
              errorForm: controller.errorPassword.value,
              errorFormMessage: controller.messageErrorPassword.value,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInUp(
            from: 500,
            child: Row(
              children: [
                Checkbox(
                  value: controller.rememberMe.value,
                  checkColor: Colors.white,
                  focusColor: purpleDefault,
                  activeColor: purpleDefault,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  onChanged: (value) {
                    controller.rememberMeTap();
                  },
                ),
                Expanded(child: TextDefault(message: "Remember Me"))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInUp(
            from: 600,
            child: Button(
              action: () {
                controller.tapSignIn();
              },
              message: "Sign In",
              colorBtn: controller.boolButtonEnable.value
                  ? purpleDefault
                  : purpleDefault.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
