import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/login_button.dart';
import '../widgets/text_form_field.dart';

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
        _controller.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.ease);
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
        key:_formKey ,
        child: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildEmailStep(screenWidth,screenHeight),
            _buildPhoneStep(screenWidth,screenHeight),
            _buildOTPStep(screenWidth,screenHeight),
            _buildResetPasswordStep(screenWidth,screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailStep(
      double screenWidth,
      double screenHeight,

      ) {
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
                        "Email",
                        style: TextStyle(color: AppColors.gray),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      MyTextFormField(
                        controller: emailController,
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

                      SizedBox(height: screenHeight * 0.25),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: LoginButton
                            (width:  screenWidth * 0.32, height: screenHeight * 0.065, text: "Next", onTap: nextPage)
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

  Widget _buildPhoneStep(double screenWidth,
      double screenHeight,) {
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
                        controller: phoneController,
                        hintText: 'Enter your phone number',
                        fillColor: AppColors.white,
                        prefixIcon: const Icon(Icons.phone_in_talk_outlined,
                            color: Colors.grey),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال البريد الإلكتروني';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: screenHeight * 0.25),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: LoginButton
                            (width:  screenWidth * 0.32, height: screenHeight * 0.065, text: "Next", onTap: nextPage)
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
  Widget _buildOTPStep(double screenWidth, double screenHeight) {
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
                    AppColors.mainColor.withOpacity(0.80),
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
                          controller: otpController,
                          backgroundColor: Colors.transparent,
                          appContext: context,
                          length: 5,
                          autoDisposeControllers: false,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.slide,
                          enableActiveFill: true,
                          cursorColor: AppColors.mainColor,
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                          onChanged: (value) {
                            // يمكنك التحقق هنا أو حفظ القيمة
                          },
                          onCompleted: (code) {
                            // عند استكمال الكود يمكن تنفيذ إجراء
                          },
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      Center(
                        child: TextButton(
                          onPressed: () {
                            // أعد إرسال OTP
                          },
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


  Widget _buildResetPasswordStep(double screenWidth, double screenHeight) {
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
                        'Reset your password ',
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
                            _confirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmPassword = !_confirmPassword;
                            });
                          },
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

                                  height: screenHeight / 4, // طول أقل
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
                                          // Navigator.of(context).pushReplacementNamed('/home');
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
