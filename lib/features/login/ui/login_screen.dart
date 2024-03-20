import 'package:blink2/core/helpers/custom_snack_bar.dart';
import 'package:blink2/core/helpers/extensions.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/features/login/logic/login_cubit/login_cubit.dart';
import 'package:blink2/features/login/ui/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            barrierColor: AppColors.kOrangeColor.withOpacity(.2),
            context: context,
            builder: (context) => const Center(
                child: CircularProgressIndicator(
              color: AppColors.kOrangeColor,
            )),
          );
        } else if (state is LoginFailure) {
          context.pop();
          setState(() {});
          if (state.errMessaeg == '1') {
            customSnackBar(context, 'Wrong Username or password');
          } else {
            customSnackBar(context, state.errMessaeg);
          }
        } else if (state is LoginSuccess) {
          setState(() {});
          customSnackBar(context, 'Logged In Successfull');
          context.pushNamed(Routes.homeScreen);
        }
      },
      child: const LoginScreenBody(),
    ));
  }
}
