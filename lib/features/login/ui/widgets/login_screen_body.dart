import 'package:blink2/core/helpers/extensions.dart';
import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/core/widgets/app_logo.dart';
import 'package:blink2/core/widgets/bottom_auth_text.dart';
import 'package:blink2/core/widgets/custom_auth_button.dart';
import 'package:blink2/core/widgets/custom_text_auth.dart';
import 'package:blink2/core/widgets/cutom_text_field.dart';
import 'package:blink2/features/login/ui/widgets/forgert_pass_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 51.w),
      child: Center(
        child: SingleChildScrollView(
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
              verticalSpace(89),
              const CustomButton(
                text: 'Sign in',
              ),
              verticalSpace(29),
              BottomAuthText(
                text1: 'Don\'t have an Account? ',
                text2: 'Sign Up!',
                onTap: () => context.pushNamed(Routes.signUpScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
