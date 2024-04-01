import 'package:blink2/core/helpers/custom_snack_bar.dart';
import 'package:blink2/core/helpers/extensions.dart';
import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/core/widgets/custom_auth_button.dart';
import 'package:blink2/core/widgets/custom_text_auth.dart';
import 'package:blink2/features/sign_up/logic/add_user_cubit/add_user_cubit.dart';
import 'package:blink2/features/sign_up/logic/email_validate_cubit/email_validate_cubit.dart';
import 'package:blink2/features/sign_up/ui/widgets/verify_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({
    super.key,
    required this.secretCode,
    required this.email,
    required this.password,
    required this.username,
    required this.phone,
    required this.dob,
  });

  final TextEditingController secretCode;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController username;
  final TextEditingController phone;
  final DateTime dob;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EmailValidateCubit, EmailValidateState>(
          listener: (context, state) {
            if (state is EmailValidateFailure) {
              if (state.errMessage == '1') {
                context.pop();
                customSnackBar(context, 'The code isn\'t correct, Try again!');
              } else {
                context.pop();
                customSnackBar(context, state.errMessage);
              }
            }
          },
        ),
        BlocListener<AddUserCubit, AddUserState>(
          listener: (context, state) async {
            if (state is AddUserFailure) {
              context.pop();
              customSnackBar(context, state.errMessage);
            } else if (state is AddUserSuccess) {
              context.pop();
              context.pushReplacementNamed(Routes.homeScreen);
              customSnackBar(context, 'Add User Successfull');
              final sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setBool('onboarding', true);
            }
          },
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 20,
          left: 20,
        ),
        child: SizedBox(
          height: 400,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomTextAuth(
                  text: 'Email Verification Code',
                  color: Colors.black,
                  size: 30,
                  fontWeight: FontWeight.w600,
                ),
                verticalSpace(24),
                const CustomTextAuth(
                  text:
                      'We sent verification code to your email, Check it out !',
                  color: AppColors.kGrayColor,
                  size: 14,
                  fontWeight: FontWeight.w100,
                ),
                verticalSpace(16),
                const CustomTextAuth(
                  text: 'Don\'t forget to check the spam',
                  color: AppColors.kGrayColor,
                  size: 14,
                  fontWeight: FontWeight.w100,
                ),
                verticalSpace(24),
                VerifyTextField(
                  labelText: 'Enter Validation code',
                  contorller: widget.secretCode,
                ),
                verticalSpace(24),
                CustomButton(
                  text: 'Submit',
                  onTap: () async {
                    await BlocProvider.of<EmailValidateCubit>(context)
                        .emailvalidate(
                      email: widget.email.text,
                      secretCode: widget.secretCode.text,
                    );
                    if (BlocProvider.of<EmailValidateCubit>(context).state
                        is EmailValidateSuccess) {
                      await context.read<AddUserCubit>().addUser(
                            email: widget.email.text,
                            password: widget.password.text,
                            username: widget.username.text,
                            phone: widget.phone.text,
                            dob: widget.dob,
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
