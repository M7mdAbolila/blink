import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/onboarding_bottom_section.dart';
import 'widgets/onboarding_page_one.dart';
import 'widgets/onboarding_page_three.dart';
import 'widgets/onboarding_page_two.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  bool isLastScreen = false;
  bool isFirstScreen = true;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(bottom: 170.h, right: 20.w, left: 20.w),
            child: PageView(
              controller: pageController,
              children: const [
                OnboardingPageOne(),
                OnboardingPageTwo(),
                OnboardingPageThree(),
              ],
              onPageChanged: (page) {
                setState(() {
                  isLastScreen = (page == 2);
                  isFirstScreen = (page == 0);
                });
              },
            ),
          ),
          bottomSheet: OnboardingBottomSection(
            pageController: pageController,
            isLastScreen: isLastScreen,
            isFirstScreen: isFirstScreen,
          ),
        ),
      ),
    );
  }
}
