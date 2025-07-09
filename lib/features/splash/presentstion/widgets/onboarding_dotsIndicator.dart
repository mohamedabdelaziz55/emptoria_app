import 'package:flutter/material.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final double width;
  final double height;

  const OnboardingDotsIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: width * 0.01),
          width: currentIndex == index ? width * 0.08 : width * 0.02,
          height: height * 0.01,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.blue : Colors.grey[400],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}