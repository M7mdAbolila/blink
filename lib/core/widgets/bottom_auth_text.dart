import 'package:blink2/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomAuthText extends StatelessWidget {
  const BottomAuthText({
    super.key,
    this.onTap,
    required this.text1,
    required this.text2,
  });
  final void Function()? onTap;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 30.w),
      child: Container(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: onTap,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: text1,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                    text: text2,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.kOrangeColor,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}