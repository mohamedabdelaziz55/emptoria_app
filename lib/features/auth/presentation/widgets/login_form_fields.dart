import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import 'text_form_field.dart';

class LoginFormFields extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final VoidCallback onToggleVisibility;

  const LoginFormFields({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.emailController,
    required this.passwordController,
    required this.obscurePassword,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(color: AppColors.gray),
        ),
        SizedBox(height: screenHeight * 0.008),
        MyTextFormField(
          controller: emailController,
          hintText: 'Enter your email address',
          fillColor: AppColors.white,
          prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال البريد الإلكتروني';
            }
            return null;
          },
        ),
        SizedBox(height: screenHeight * 0.025),
        const Text(
          "Password",
          style: TextStyle(color: AppColors.gray),
        ),
        SizedBox(height: screenHeight * 0.008),
        MyTextFormField(
          controller: passwordController,
          hintText: 'Enter your password',
          fillColor: Colors.white,
          obscureText: obscurePassword,
          prefixIcon: const Icon(Icons.lock_outline, color: AppColors.gray),
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey,
            ),
            onPressed: onToggleVisibility,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال كلمة المرور';
            }
            return null;
          },
        ),
      ],
    );
  }
}
