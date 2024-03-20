import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.isPassword,
    required this.labelText,
    required this.contorller,
  });
  final String labelText;
  final bool isPassword;
  final TextEditingController contorller;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.contorller,
      obscureText: passwordVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field cannot be empty';
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
          child: widget.isPassword
              ? passwordVisible
                  ? Image.asset('assets/images/eye_off.png')
                  : Image.asset('assets/images/eye.png')
              : const SizedBox(),
        ),
      ),
    );
  }
}
