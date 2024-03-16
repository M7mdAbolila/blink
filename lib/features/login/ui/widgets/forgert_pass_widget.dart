import 'package:blink2/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ForgetPassWidget extends StatelessWidget {
  const ForgetPassWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: GestureDetector(
        child: Container(
          alignment: Alignment.centerRight,
          child: const Text(
            'Forget password?',
            style: TextStyle(
              color: AppColors.kOrangeColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.kOrangeColor,
              decorationThickness: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
