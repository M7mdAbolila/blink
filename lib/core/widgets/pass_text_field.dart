import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class PassTextField extends StatefulWidget {
  const PassTextField({
    super.key,
    required this.labelText,
    required this.contorller,
  });
  final String labelText;
  final TextEditingController contorller;
  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.contorller,
      obscureText: passwordVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field cannot be empty';
        } else if (value.length <= 8) {
          return 'Password must be over 8 characters and digits';
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
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            child: passwordVisible
                ? Image.asset('assets/images/eye_off.png')
                : Image.asset('assets/images/eye.png')),
      ),
    );
  }
}
