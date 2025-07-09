import 'package:flutter/material.dart';

class LoginSocialButtons extends StatelessWidget {
  const LoginSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          image: 'assets/icons/google.png',
          size: screenWidth * 0.06,
          containerSize: screenWidth * 0.13,
          onTap: () {},
        ),
        SizedBox(width: screenWidth * 0.05),
        _buildSocialButton(
          image: 'assets/icons/facebook.png',
          size: screenWidth * 0.07,
          containerSize: screenWidth * 0.13,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String image,
    required double size,
    required double containerSize,
    required VoidCallback onTap,
  }) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(containerSize * 0.23),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: IconButton(
        icon: Image.asset(image, width: size, height: size),
        onPressed: onTap,
      ),
    );
  }
}
