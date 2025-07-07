import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class LoginHeader extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const LoginHeader({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: screenWidth * 0.8,
        height: screenHeight * 0.35,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.mainColor.withValues(alpha: 0.80),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(screenWidth * 0.8),
          ),
        ),
      ),
    );
  }
}
