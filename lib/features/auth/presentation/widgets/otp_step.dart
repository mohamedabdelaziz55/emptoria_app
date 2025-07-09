import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/app_colors.dart';
import 'login_button.dart';

class OTPStep extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final TextEditingController controller;
  final VoidCallback nextPage;

  const OTPStep({
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
                        'OTP verification',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        "Enter the code we sent to your mobile number/email address.",
                        style: TextStyle(
                          color: AppColors.gray,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Center(
                        child: Text(
                          "02:32",
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: PinCodeTextField(
                          controller: controller,
                          backgroundColor: Colors.transparent,
                          appContext: context,
                          length: 5,
                          autoDisposeControllers: false,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.slide,
                          enableActiveFill: true,
                          cursorColor: AppColors.mainColor,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: screenHeight * 0.060,
                            fieldWidth: screenWidth * 0.13,
                            activeFillColor: Colors.white,
                            selectedFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            inactiveColor: Colors.grey.shade400,
                            activeColor: AppColors.mainColor,
                            selectedColor: AppColors.mainColor,
                          ),
                          onChanged: (value) {},
                          onCompleted: (code) {},
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Didn't receive the OTP?",
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.17),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: LoginButton(
                          width: screenWidth * 0.32,
                          height: screenHeight * 0.065,
                          text: "Submit",
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