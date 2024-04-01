import 'package:blink2/core/helpers/spacing.dart';
import 'package:blink2/features/onboarding/ui/widgets/onboarding_app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const OnboradingAppLogo(),
          verticalSpace(60),
          Image.asset(
            'assets/images/onboarding_page_one.png',
            width: 340,
          ),
          verticalSpace(70),
          SvgPicture.asset('assets/svgs/onboarding_welcome.svg'),
          verticalSpace(60),
          SvgPicture.asset('assets/svgs/onboarding_welcome_text.svg'),
        ],
      ),
    );
  }
}
