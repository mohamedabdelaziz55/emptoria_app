import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/routes/app_route.gr.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form_fields.dart';
import '../widgets/login_social_buttons.dart';
import '../widgets/login_header.dart';


@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isPortrait = media.orientation == Orientation.portrait;
    final screenWidth = isPortrait ? media.size.width : media.size.height;
    final screenHeight = isPortrait ? media.size.height : media.size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Stack(
            children: [
              LoginHeader(screenWidth: screenWidth, screenHeight: screenHeight),
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
                            'Login',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: AppColors.gray,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => context.pushRoute(SignUpRoute()),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: const Color(0xFF007BFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          LoginFormFields(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            obscurePassword: _obscurePassword,
                            onToggleVisibility: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => context.pushRoute(ForgotPasswordFlow()),
                              child: const Text(
                                "FORGOT",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF007BFF),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF007BFF),
                                  decorationThickness: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Align(
                            alignment: Alignment.centerRight,
                            child: LoginButton(
                              image: 'assets/icons/arrow.png',
                              width: screenWidth * 0.32,
                              height: screenHeight * 0.065,
                              text: "Login",
                              onTap: () => context.pushRoute(DashboardRoute()),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          const LoginSocialButtons(),
                          SizedBox(height: screenHeight * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
