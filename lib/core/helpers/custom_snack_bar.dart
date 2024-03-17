import 'package:blink2/core/theme/colors.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.kOrangeColor,
      content: Text(text),
    ),
  );
}