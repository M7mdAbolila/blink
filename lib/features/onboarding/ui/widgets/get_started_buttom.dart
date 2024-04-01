import 'package:blink2/core/helpers/extensions.dart';
import 'package:blink2/core/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_auth.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(Routes.loginScreen);
      },
      child: Container(
        height: 60,
        width: 170,
        decoration: BoxDecoration(
          color: const Color(0xffFF9933),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: CustomTextAuth(
            text: 'Get Started!',
            fontWeight: FontWeight.w700,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
