import 'package:emptoria_app_team/features/auth/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/app_colors.dart';
import 'login_button.dart';

class ResetPasswordStep extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool obscurePassword;
  final bool confirmPassword;
  final VoidCallback togglePasswordVisibility;
  final VoidCallback toggleConfirmPasswordVisibility;

  const ResetPasswordStep({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePassword,
    required this.confirmPassword,
    required this.togglePasswordVisibility,
    required this.toggleConfirmPasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: screenHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.27),
                      const Text(
                        'Reset your password',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        "Enter your new password.",
                        style: TextStyle(
                          color: AppColors.gray,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      const Text(
                        "Password",
                        style: TextStyle(color: AppColors.gray),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      MyTextFormField(
                        controller: passwordController,
                        hintText: 'Type your new password',
                        fillColor: AppColors.white,
                        prefixIcon: const Icon(Icons.lock_outline_rounded,
                            color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: togglePasswordVisibility,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      const Text(
                        "Confirm Password",
                        style: TextStyle(color: AppColors.gray),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      MyTextFormField(
                        controller: confirmPasswordController,
                        hintText: 'Retype your new password',
                        fillColor: AppColors.white,
                        prefixIcon: const Icon(Icons.lock_outline_rounded,
                            color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            confirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: toggleConfirmPasswordVisibility,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء تأكيد كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.25),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: LoginButton(
                          width: screenWidth * 0.32,
                          height: screenHeight * 0.065,
                          text: "Next",
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => Dialog(
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  height: screenHeight / 4,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Lottie.asset(
                                        'assets/icons/success.json',
                                        width: 120,
                                        height: 120,
                                        repeat: false,
                                        onLoaded: (composition) async {
                                          await Future.delayed(composition.duration);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        "Your password has been updated.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}