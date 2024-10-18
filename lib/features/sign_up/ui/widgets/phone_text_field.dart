import 'package:blink2/core/helpers/text_field_decor.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.contorller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field cannot be empty';
        } else if (value.length > 11 || value.length < 11) {
          return 'Phone must be 11 digit';
        }
        return null;
      },
      decoration: textFieldDecoration(labelText: widget.labelText),
    );
  }
}
