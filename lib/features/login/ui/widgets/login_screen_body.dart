import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/core/widgets/app_logo.dart';
import 'package:blink2/core/widgets/custom_text_auth.dart';
import 'package:blink2/core/widgets/cutom_text_field.dart';
import 'package:blink2/features/login/ui/widgets/forgert_pass_widget.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 51),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLogo(),
            verticalSpace(103),
            const CustomTextAuth(
              text: 'SIGN IN',
              color: AppColors.kGrayColor,
              size: 36,
              fontWeight: FontWeight.w500,
            ),
            verticalSpace(55),
            CustomTextField(
              labelText: 'email',
              contorller: email,
              isPassword: false,
            ),
            verticalSpace(25),
            CustomTextField(
              labelText: 'password',
              contorller: password,
              isPassword: true,
            ),
            const ForgetPassWidget(),
          ],
        ),
      ),
    );
  }
}
