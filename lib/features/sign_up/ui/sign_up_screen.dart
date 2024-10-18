import 'package:blink2/core/helpers/custom_snack_bar.dart';
import 'package:blink2/features/sign_up/logic/user_validate_cubit/user_validate_cubit.dart';
import 'package:blink2/features/sign_up/ui/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserValidateCubit, UserValidateState>(
        listener: (context, state) {
          if (state is UserValidateFailure) {
            if (state.errMessage == '1') {
              customSnackBar(context, 'Username Exists');
            } else if (state.errMessage == '2') {
              customSnackBar(context, 'Email Exists');
            } else if (state.errMessage == '3') {
              customSnackBar(context, 'Phone Exists');
            } else {
              customSnackBar(context, state.errMessage);
            }
          }
        },
        child: const SignUpScreenBody(),
      ),
    );
  }
}
