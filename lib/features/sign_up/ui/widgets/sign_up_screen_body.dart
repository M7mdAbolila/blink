import 'package:blink2/core/helpers/extensions.dart';
import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/core/widgets/app_logo.dart';
import 'package:blink2/core/widgets/bottom_auth_text.dart';
import 'package:blink2/core/widgets/custom_auth_button.dart';
import 'package:blink2/core/widgets/custom_text_auth.dart';
import 'package:blink2/core/widgets/cutom_text_field.dart';
import 'package:blink2/features/sign_up/ui/widgets/date_of_birth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreenBody extends StatelessWidget {
  SignUpScreenBody({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime? dob;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 51.w),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLogo(),
              verticalSpace(103),
               CustomTextAuth(
                text: 'SIGN UP',
                color: AppColors.kGrayColor,
                size: 36.sp,
                fontWeight: FontWeight.w500,
              ),
              verticalSpace(55),
              CustomTextField(
                labelText: 'Username',
                contorller: username,
                isPassword: false,
              ),
              verticalSpace(25),
              CustomTextField(
                labelText: 'Phone',
                contorller: phone,
                isPassword: false,
              ),
              verticalSpace(25),
              CustomTextField(
                labelText: 'Email',
                contorller: email,
                isPassword: false,
              ),
              verticalSpace(25),
              CustomTextField(
                labelText: 'Create new password',
                contorller: password,
                isPassword: true,
              ),
              verticalSpace(25),
              DateOfBirthInput(
                labelText: 'Select Date of birth',
                onDateSelected: (data) => dob = data,
              ),
              verticalSpace(89),
              const CustomButton(
                text: 'Let\'s Go!',
              ),
              verticalSpace(29),
              BottomAuthText(
                text1: 'Already have an account? ',
                text2: 'Login!',
                onTap: () => context.pushNamed(Routes.loginScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
