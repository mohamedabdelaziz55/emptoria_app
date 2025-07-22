import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/routes/app_route.gr.dart';
import '../../../../core/utils/app_colors.dart';
import '../river_pod/sign_up_river_pod/sing_up_river_pod.dart';
import '../widgets/login_button.dart';
import '../widgets/signup_form_fields.dart';
import '../widgets/signup_header.dart';

@RoutePage()
class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = MediaQuery.of(context);
    final isPortrait = media.orientation == Orientation.portrait;
    final screenWidth = isPortrait ? media.size.width : media.size.height;
    final screenHeight = isPortrait ? media.size.height : media.size.width;

    final obscurePassword = ref.watch(obscurePasswordProvider);
    final obscureConfirmPassword = ref.watch(obscureConfirmPasswordProvider);
    final isLoading = ref.watch(isSignUpLoadingProvider);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Stack(
            children: [
              SignUpHeader(screenWidth: screenWidth, screenHeight: screenHeight),
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
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                                onTap: () => context.pushRoute(LoginRoute()),
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
                          SignUpFormFields(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            nameController: _nameController,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            confirmPasswordController: _confirmPasswordController,
                            obscurePassword: obscurePassword,
                            obscureConfirmPassword: obscureConfirmPassword,
                            onTogglePassword: () => ref
                                .read(obscurePasswordProvider.notifier)
                                .state = !obscurePassword,
                            onToggleConfirmPassword: () => ref
                                .read(obscureConfirmPasswordProvider.notifier)
                                .state = !obscureConfirmPassword,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: isLoading
                                ? CircularProgressIndicator(color: AppColors.black)
                                : LoginButton(
                              image: 'assets/icons/arrow.png',
                              width: screenWidth * 0.32,
                              height: screenHeight * 0.065,
                              text: "Sign Up",
                              onTap: () {
                                ref.read(signUpProvider).signUp(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  confirmPassword: _confirmPasswordController.text,
                                  formKey: _formKey,
                                  context: context,
                                );
                              },
                            ),
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
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new, color: AppColors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}