import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/features/auth/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_route.gr.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/login_button.dart';
@RoutePage()
class SignUpScreen extends StatefulWidget {

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmPasswordController = TextEditingController();

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
                        AppColors.mainColor.withValues(alpha: 0.80),
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
                            'Create Account',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              Text(
                                "I Already Have an Account ",
                                style: TextStyle(
                                  color: AppColors.gray,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.pushRoute(LoginRoute());


                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: const Color(0xFF007BFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),

                          const Text(
                            "Name",
                            style: TextStyle(color: AppColors.gray),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          MyTextFormField(
                            controller: _nameController,
                            hintText: 'Enter your full name',
                            fillColor: AppColors.white,
                            prefixIcon: const Icon(Icons.drive_file_rename_outline,
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
                            hintText: 'Type your new password',
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
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

                          SizedBox(height: screenHeight * 0.025),


                          const Text(
                            "Confirm Passowrd",
                            style: TextStyle(color: AppColors.gray),
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          MyTextFormField(
                            controller: _ConfirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            hintText: 'Retype your new password',
                            fillColor: AppColors.white,
                            prefixIcon: const Icon(Icons.lock_outline_rounded,
                                color: Colors.grey),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword = !_obscureConfirmPassword;
                                });
                              },
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال البريد الإلكتروني';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.025),

                          Align(
                              alignment: Alignment.center,
                              child: LoginButton
                                (image: 'assets/icons/arrow.png', width:  screenWidth * 0.32, height: screenHeight * 0.065, text: "Sign Up", onTap: (){
                                context.pushRoute(Dashboard());

                              })
                          ),
                          SizedBox(height: screenHeight * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: screenWidth * 0.08,
                  left: screenWidth * 0.05,
                  child: InkWell(
                      onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios_new,color: AppColors.black,))),

            ],
          ),
        ),
      ),
    );
  }
}
