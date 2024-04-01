
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboradingAppLogo extends StatelessWidget {
  const OnboradingAppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/Blink.svg',
      height: 74.h,
      width: 170.w,
    );
  }
}