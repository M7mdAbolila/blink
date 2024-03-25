import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    required this.labelText,
    required this.contorller,
  });
  final String labelText;

  final TextEditingController contorller;
  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.contorller,
      obscureText: passwordVisible,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field cannot be empty';
        } else if (value.length > 11 || value.length < 11) {
          return 'Phone must be 11 digit';
        }
        return null;
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
