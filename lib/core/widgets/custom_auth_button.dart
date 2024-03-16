import 'package:blink2/core/theme/colors.dart';
import 'package:blink2/core/widgets/custom_text_auth.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 36,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kOrangeAccentColor,
          borderRadius: BorderRadius.circular(53),
        ),
        child: Center(
          child: CustomTextAuth(
            text: text,
            fontWeight: FontWeight.w700,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
