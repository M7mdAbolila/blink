import 'package:blink2/core/routing/routes.dart';
import 'package:blink2/features/home/ui/home_screen.dart';
import 'package:blink2/features/login/logic/login_cubit/login_cubit.dart';
import 'package:blink2/features/login/ui/login_screen.dart';
import 'package:blink2/features/sign_up/logic/add_user_cubit/add_user_cubit.dart';
import 'package:blink2/features/sign_up/logic/email_validate_cubit/email_validate_cubit.dart';
import 'package:blink2/features/sign_up/logic/user_validate_cubit/user_validate_cubit.dart';
import 'package:blink2/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddUserCubit(),
              ),
              BlocProvider(
                create: (context) => UserValidateCubit(),
              ),
              BlocProvider(
                create: (context) => EmailValidateCubit(),
              ),
            ],
            child: const SignUPScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
