import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../auth/presentation/pages/login_screen.dart';

class SkipButton extends StatelessWidget {
  final double width;

  const SkipButton({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: width * 0.05,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        },
        child: Text(
          "Skip",
          style: TextStyle(fontSize: width * 0.045, color: AppColors.gray),
        ),
      ),
    );
  }
}