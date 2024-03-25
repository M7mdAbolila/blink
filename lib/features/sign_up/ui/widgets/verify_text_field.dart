import 'package:blink2/core/helpers/text_field_decor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.contorller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field cannot be empty';
        } else if (value.length < 6 || value.length > 6) {
          return 'Code must be 6 digits';
        }
        return null;
      },
      decoration: textFieldDecoration(labelText: widget.labelText),
    );
  }
}
