import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../widgets/email_step.dart';
import '../widgets/otp_step.dart';
import '../widgets/phone_step.dart';
import '../widgets/reset_password_step.dart';



@RoutePage()
class ForgotPasswordFlow extends StatefulWidget {
  const ForgotPasswordFlow({super.key});

  @override
  _ForgotPasswordFlowState createState() => _ForgotPasswordFlowState();
}

class _ForgotPasswordFlowState extends State<ForgotPasswordFlow> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool _obscurePassword = true;
  bool _confirmPassword = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void nextPage() {
    if (_currentPage < 4) {
      setState(() {
        _currentPage++;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isPortrait = media.orientation == Orientation.portrait;
    final screenWidth = isPortrait ? media.size.width : media.size.height;
    final screenHeight = isPortrait ? media.size.height : media.size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            EmailStep(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              controller: emailController,
              nextPage: nextPage,
            ),
            PhoneStep(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              controller: phoneController,
              nextPage: nextPage,
            ),
            OTPStep(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              controller: otpController,
              nextPage: nextPage,
            ),
            ResetPasswordStep(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              obscurePassword: _obscurePassword,
              confirmPassword: _confirmPassword,
              togglePasswordVisibility: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              toggleConfirmPasswordVisibility: () {
                setState(() {
                  _confirmPassword = !_confirmPassword;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}










