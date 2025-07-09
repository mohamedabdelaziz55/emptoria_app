import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/core/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

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
          context.router.push(LoginRoute());
        },
        child: Text(
          "Skip",
          style: TextStyle(fontSize: width * 0.045, color: AppColors.gray),
        ),
      ),
    );
  }
}