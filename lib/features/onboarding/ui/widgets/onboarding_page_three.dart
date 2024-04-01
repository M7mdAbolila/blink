import 'package:blink2/features/onboarding/ui/widgets/onboarding_app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';

class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          verticalSpace(50),
          const OnboradingAppLogo(),
          verticalSpace(47),
          Image.asset(
            'assets/images/onboarding_page_three.png',
            width: 340,
          ),
          verticalSpace(51),
          SvgPicture.asset('assets/svgs/onboarding_capture.svg'),
          verticalSpace(43),
          Image.asset('assets/images/onboarding_capture_text.png'),
        ],
      ),
    );
  }
}
