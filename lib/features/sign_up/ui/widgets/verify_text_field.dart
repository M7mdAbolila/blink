import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class VerifyTextField extends StatefulWidget {
  const VerifyTextField({
    super.key,

    required this.labelText,
    required this.contorller,
  });
  final String labelText;

  final TextEditingController contorller;
  @override
  State<VerifyTextField> createState() => _VerifyTextFieldState();
}

class _VerifyTextFieldState extends State<VerifyTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.contorller,
      obscureText: passwordVisible,
      keyboardType: TextInputType.number, // Show number keyboard
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Allow only digits
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field cannot be empty';
        }
        try {
          int.parse(value); // Attempt to parse as int
          return null; // Valid input
        } on FormatException {
          return "Invalid integer"; // Handle parsing errors
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 0,
        ),
        labelText: widget.labelText,
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
        
      ),
    );
  }
}
