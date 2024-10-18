import 'package:blink2/core/helpers/calculate_age.dart';
import 'package:blink2/core/helpers/custom_snack_bar.dart';
import 'package:blink2/core/helpers/extensions.dart';
import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:blink2/core/widgets/app_logo.dart';
import 'package:blink2/core/widgets/bottom_auth_text.dart';
import 'package:blink2/core/widgets/custom_auth_button.dart';
import 'package:blink2/features/sign_up/logic/add_user_cubit/add_user_cubit.dart';
import 'package:blink2/features/sign_up/logic/email_validate_cubit/email_validate_cubit.dart';
import 'package:blink2/features/sign_up/logic/user_validate_cubit/user_validate_cubit.dart';
import 'package:blink2/features/sign_up/ui/widgets/date_of_birth_input.dart';
import 'package:blink2/features/sign_up/ui/widgets/email_verify_widget.dart';
import 'package:blink2/features/sign_up/ui/widgets/info_section.dart';
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
  DateTime dob = DateTime.now();
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
                InfoInputSection(
                    username: username,
                    phone: phone,
                    email: email,
                    password: password),
                DateOfBirthInput(
                  labelText: 'Select Date of birth',
                  onDateSelected: (data) => dob = data,
                ),
                verticalSpace(60),
                CustomButton(
                  text: 'Let\'s Go!',
                  onTap: () async {
                    int age = calculateAge(dob);
                    if (_formKey.currentState!.validate()) {
                      if (age < 18) {
                        customSnackBar(context, 'Age must be 18 or over');
                      } else {
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
