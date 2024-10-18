
  import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

InputDecoration textFieldDecoration({ required String labelText}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 0,
      ),
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: GradientOutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xffCD55FB),
            Color(0xffFF4D51),
            Color(0xffFCB341),
            Color(0xffFF4D51),
            Color(0xffCD55FB),
          ],
        ),
      ),
      
    );
  }

