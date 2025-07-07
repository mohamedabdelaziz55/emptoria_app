

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../auth/presentation/widgets/login_button.dart';

class OnboardingNavigationButtons extends StatelessWidget {
  final int currentIndex;
  final int total;
  final double width;
  final double height;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingNavigationButtons({
    super.key,
    required this.currentIndex,
    required this.total,
    required this.width,
    required this.height,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final isLast = currentIndex == total - 1;

    return Row(
      mainAxisAlignment: isLast ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
      children: [
        if (currentIndex == 1)
          TextButton(
            onPressed: onBack,
            child: Text("Back", style: TextStyle(fontSize: width * 0.045, color: AppColors.gray)),
          )
        else if (!isLast)
          SizedBox(width: width * 0.15),
        LoginButton(
          image: null,
          width: isLast ? width * 0.4 : width * 0.3,
          height: height * 0.06,
          text: isLast ? "Let's start !" : "Next",
          onTap: onNext,
        ),
      ],
    );
  }
}