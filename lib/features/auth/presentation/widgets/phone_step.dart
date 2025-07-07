
import 'package:emptoria_app_team/features/auth/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'login_button.dart';

class PhoneStep extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final TextEditingController controller;
  final VoidCallback nextPage;

  const PhoneStep({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.controller,
    required this.nextPage,
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
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        "We will send you a message to set or \n reset your new password.",
                        style: TextStyle(
                          color: AppColors.gray,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      const Text(
                        "Phone number",
                        style: TextStyle(color: AppColors.gray),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      MyTextFormField(
                        controller: controller,
                        hintText: 'Enter your phone number',
                        fillColor: AppColors.white,
                        prefixIcon: const Icon(Icons.phone_in_talk_outlined,
                            color: Colors.grey),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال رقم الهاتف';
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
                          onTap: nextPage,
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