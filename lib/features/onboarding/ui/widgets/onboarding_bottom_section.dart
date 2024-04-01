import 'package:blink2/features/onboarding/ui/widgets/next_page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/colors.dart';
import 'get_started_buttom.dart';

class OnboardingBottomSection extends StatefulWidget {
  const OnboardingBottomSection({
    super.key,
    required this.pageController,
    required this.isLastScreen,
    required this.isFirstScreen,
  });

  final PageController pageController;
  final bool isLastScreen;
  final bool isFirstScreen;
  @override
  State<OnboardingBottomSection> createState() =>
      _OnboardingBottomSectionState();
}

class _OnboardingBottomSectionState extends State<OnboardingBottomSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 170.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: widget.pageController,
              count: 3,
              effect: const WormEffect(
                spacing: 16,
                dotColor: AppColors.kOrangeAccentColor,
                activeDotColor: AppColors.kOrangeColor,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 3,
              ),
              onDotClicked: (index) => widget.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              ),
            ),
            verticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.isFirstScreen
                    ? TextButton(
                        onPressed: () {
                          widget.pageController.jumpToPage(2);
                        },
                        child: const Text(
                          'skip',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.kGrayColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          widget.pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.kGrayColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                widget.isLastScreen
                    ? const GetStartedButton()
                    : NextPageButton(
                        pageController: widget.pageController,
                      ),
              ],
            ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
