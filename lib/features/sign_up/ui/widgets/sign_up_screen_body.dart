import 'package:blink2/core/helpers/extensions.dart';
import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/core/widgets/app_logo.dart';
import 'package:blink2/core/widgets/bottom_auth_text.dart';
import 'package:blink2/core/widgets/custom_auth_button.dart';
import 'package:blink2/core/widgets/custom_text_auth.dart';
import 'package:blink2/core/widgets/app_text_field.dart';
import 'package:blink2/core/widgets/pass_text_field.dart';
import 'package:blink2/features/sign_up/logic/add_user_cubit/add_user_cubit.dart';
import 'package:blink2/features/sign_up/logic/email_validate_cubit/email_validate_cubit.dart';
import 'package:blink2/features/sign_up/logic/user_validate_cubit/user_validate_cubit.dart';
import 'package:blink2/features/sign_up/ui/widgets/date_of_birth_input.dart';
import 'package:blink2/features/sign_up/ui/widgets/email_verify_widget.dart';
import 'package:blink2/features/sign_up/ui/widgets/phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});
  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final secretCode = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final DateTime dob;
  @override
  Widget build(BuildContext context) {
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
                ),
                verticalSpace(20),
                PassTextField(
                  labelText: 'Create new password',
                  contorller: password,
                ),
                verticalSpace(25),
                DateOfBirthInput(
                  labelText: 'Select Date of birth',
                  onDateSelected: (data) => dob = data,
                ),
                verticalSpace(60),
                CustomButton(
                  text: 'Let\'s Go!',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await BlocProvider.of<UserValidateCubit>(context)
                          .userValidate(
                        email: email.text,
                        username: username.text,
                        phone: phone.text,
                      );
                      if (BlocProvider.of<UserValidateCubit>(context).state
                          is UserValidateSuccess) {
                        emailValidateBottomSheet(context);
                      }
                    }
                  },
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
      ),
    );
  }

  Future<dynamic> emailValidateBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => EmailValidateCubit(),
              ),
              BlocProvider(
                create: (context) => AddUserCubit(),
              ),
            ],
            child: EmailVerification(
              secretCode: secretCode,
              email: email,
              password: password,
              username: username,
              phone: phone,
              dob: dob,
            ),
          );
        });
  }
}
