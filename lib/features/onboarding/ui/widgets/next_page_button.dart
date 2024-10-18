import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: const Color(0xffFF9933),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Image.asset('assets/images/Arrow.png'),
        ),
      ),
    );
  }
}
