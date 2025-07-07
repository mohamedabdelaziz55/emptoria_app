
import 'package:emptoria_app_team/features/auth/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SignUpFormFields extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final VoidCallback onTogglePassword;
  final VoidCallback onToggleConfirmPassword;

  const SignUpFormFields({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.onTogglePassword,
    required this.onToggleConfirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Name", style: TextStyle(color: AppColors.gray)),
        SizedBox(height: screenHeight * 0.008),
        MyTextFormField(
          controller: nameController,
          hintText: 'Enter your full name',
          fillColor: AppColors.white,
          prefixIcon: const Icon(Icons.drive_file_rename_outline, color: Colors.grey),
          validator: (value) => (value == null || value.isEmpty) ? 'الرجاء إدخال الاسم الكامل' : null,
        ),
        SizedBox(height: screenHeight * 0.025),
        const Text("Email", style: TextStyle(color: AppColors.gray)),
        SizedBox(height: screenHeight * 0.008),
        MyTextFormField(
          controller: emailController,
          hintText: 'Enter your email address',
          fillColor: AppColors.white,
          prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
          validator: (value) => (value == null || value.isEmpty) ? 'الرجاء إدخال البريد الإلكتروني' : null,
        ),
        SizedBox(height: screenHeight * 0.025),
        const Text("Password", style: TextStyle(color: AppColors.gray)),
        SizedBox(height: screenHeight * 0.008),
        MyTextFormField(
          controller: passwordController,
          hintText: 'Type your new password',
          fillColor: Colors.white,
          obscureText: obscurePassword,
          prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.gray),
          suffixIcon: IconButton(
            icon: Icon(obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey),
            onPressed: onTogglePassword,
          ),
          validator: (value) => (value == null || value.isEmpty) ? 'الرجاء إدخال كلمة المرور' : null,
        ),
        SizedBox(height: screenHeight * 0.025),
        const Text("Confirm Password", style: TextStyle(color: AppColors.gray)),
        SizedBox(height: screenHeight * 0.008),
        MyTextFormField(
          controller: confirmPasswordController,
          hintText: 'Retype your new password',
          fillColor: AppColors.white,
          obscureText: obscureConfirmPassword,
          prefixIcon: const Icon(Icons.lock_outline_rounded, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey),
            onPressed: onToggleConfirmPassword,
          ),
          validator: (value) => (value == null || value.isEmpty) ? 'الرجاء تأكيد كلمة المرور' : null,
        ),
        SizedBox(height: screenHeight * 0.025),
      ],
    );
  }
}