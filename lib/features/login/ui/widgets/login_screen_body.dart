import 'package:blink2/core/helpers/extensions.dart';
import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/core/widgets/app_logo.dart';
import 'package:blink2/core/widgets/bottom_auth_text.dart';
import 'package:blink2/core/widgets/custom_auth_button.dart';
import 'package:blink2/core/widgets/custom_text_auth.dart';
import 'package:blink2/core/widgets/cutom_text_field.dart';
import 'package:blink2/features/login/logic/login_cubit/login_cubit.dart';
import 'package:blink2/features/login/ui/widgets/forgert_pass_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final email = TextEditingController();

  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 51.w),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                CustomButton(
                  text: 'Sign in',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      cubit.login(email: email.text, password: password.text);
                    }
                  },
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
      ),
    );
  }
}
