import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/core/widgets/app_text_field.dart';
import 'package:blink2/core/widgets/custom_text_auth.dart';
import 'package:blink2/core/widgets/pass_text_field.dart';
import 'package:blink2/features/sign_up/ui/widgets/phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoInputSection extends StatelessWidget {
  const InfoInputSection({
    super.key,
    required this.username,
    required this.phone,
    required this.email,
    required this.password,
  });

  final TextEditingController username;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(70),
        CustomTextAuth(
          text: 'SIGN UP',
          color: AppColors.kGrayColor,
          size: 36.sp,
          fontWeight: FontWeight.w500,
        ),
        verticalSpace(45),
        AppTextField(
          labelText: 'Username',
          contorller: username,
          textInputType: TextInputType.name,
        ),
        verticalSpace(20),
        PhoneTextField(
          labelText: 'Phone',
          contorller: phone,
        ),
        verticalSpace(20),
        AppTextField(
          labelText: 'Email',
          contorller: email,
          textInputType: TextInputType.emailAddress,
        ),
        verticalSpace(20),
        PassTextField(
          labelText: 'Create new password',
          contorller: password,
        ),
        verticalSpace(25),
      ],
    );
  }
}
