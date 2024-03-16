import 'package:flutter/material.dart';

class CustomTextAuth extends StatelessWidget {
  const CustomTextAuth({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    required this.fontWeight,
  });
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'LTSaeada',
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
