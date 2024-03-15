import 'package:blink2/core/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppLogo(),
        ],
      ),
    );
  }
}
