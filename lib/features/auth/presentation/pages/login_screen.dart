
import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/features/auth/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/routes/app_route.gr.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/login_button.dart';

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
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.mainColor.withOpacity(0.80),
                        Colors.white
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
                                onTap: () {
                                  context.pushRoute(SignUpRoute());

                                },
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
                          const Text(
                            "Email",
                            style: TextStyle(color: AppColors.gray),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          MyTextFormField(
                            controller: _emailController,
                            hintText: 'Enter your email address',
                            fillColor: AppColors.white,
                            prefixIcon: const Icon(Icons.email_outlined,
                                color: Colors.grey),
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
                            hintText: 'Enter your password',
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: AppColors.gray,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال كلمة المرور';
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                context.pushRoute(ForgotPasswordFlow());

                              },
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
                            child: LoginButton
                              (image: 'assets/icons/arrow.png', width:  screenWidth * 0.32, height: screenHeight * 0.065, text: "Login", onTap: (){
                              context.pushRoute(Dashboard());

                            })
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth * 0.13,
                                height: screenWidth * 0.13,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/icons/google.png',
                                    width: screenWidth * 0.06,
                                    height: screenWidth * 0.06,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              Container(
                                width: screenWidth * 0.13,
                                height: screenWidth * 0.13,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(screenWidth * 0.03),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/icons/facebook.png',
                                    width: screenWidth * 0.07,
                                    height: screenWidth * 0.07,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
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
