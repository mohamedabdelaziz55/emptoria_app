import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/utils/app_colors.dart';
import 'package:emptoria_app_team/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../routes/app_route.gr.dart';
import '../auth/login_screen.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_OnboardingData> onboardingPages = [
    _OnboardingData(
      image: 'assets/images/choose_products.png',
      title: 'Choose Products',
      description:
      'Explore a wide range of diverse products and easily choose what fits your needs, starting a smooth and secure shopping experience from wherever you are.',
    ),
    _OnboardingData(
      image: 'assets/images/make_payment.png',
      title: 'Make Payment',
      description:
      'Choose the payment method that suits you and complete your purchase securely and effortlessly, with multiple options ensuring a smooth and trusted shopping experience.',
    ),
    _OnboardingData(
      image: 'assets/images/get_your_order.png',
      title: 'Get Your Order',
      description:
      'Receive your order quickly and right on time, with real-time tracking to keep you informed every step of the way—from checkout to your doorstep.',
    ),
  ];

  void _nextPage() {
    if (_currentIndex < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.pushRoute(LoginRoute());

    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isPortrait = media.orientation == Orientation.portrait;
    final width = isPortrait ? media.size.width : media.size.height;
    final height = isPortrait ? media.size.height : media.size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                final data = onboardingPages[index];
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.08,
                      vertical: height * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.08),
                        Image.asset(data.image, height: height * 0.35),
                        SizedBox(height: height * 0.06),
                        Text(
                          data.title,
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Html(
                          data: "<p style='text-align: justify;'>${data.description}</p>",
                          style: {
                            "p": Style(
                              fontSize: FontSize(width * 0.04),
                              color: Colors.grey[700],
                            ),
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            if (_currentIndex < onboardingPages.length - 1)
              Positioned(
                top: height * 0.02,
                right: width * 0.05,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginScreen()));

                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: width * 0.045, color: AppColors.gray),
                  ),
                ),
              ),

            Positioned(
              bottom: height * 0.03,
              left: width * 0.05,
              right: width * 0.05,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingPages.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                        width: _currentIndex == index ? width * 0.08 : width * 0.02,
                        height: height * 0.01,
                        decoration: BoxDecoration(
                          color: _currentIndex == index ? Colors.blue : Colors.grey[400],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.08),

                  Row(
                    mainAxisAlignment: _currentIndex < onboardingPages.length - 1
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      if (_currentIndex == 1)
                        TextButton(
                          onPressed: _previousPage,
                          child: Text("Back",
                              style: TextStyle(
                                  fontSize: width * 0.045, color: AppColors.gray)),
                        )
                      else
                        if(_currentIndex < onboardingPages.length - 1)
                             SizedBox(width: width * 0.15),



                      LoginButton(
                        image: null,
                          width:  _currentIndex == onboardingPages.length - 1
                              ? width * 0.4
                              : width * 0.3,
                          height: height * 0.06,
                          text:   _currentIndex == onboardingPages.length - 1
                              ? "Let's start !"
                              : "Next",
                          onTap: _nextPage),


                      // Container(
                      //   width: _currentIndex == onboardingPages.length - 1
                      //       ? width * 0.4
                      //       : width * 0.3,
                      //   height: height * 0.06,
                      //   decoration: BoxDecoration(
                      //     color: AppColors.mainColor,
                      //     borderRadius: BorderRadius.circular(width * 0.04),
                      //   ),
                      //   child: InkWell(
                      //     onTap: _nextPage,
                      //     child: Center(
                      //       child: Text(
                      //         _currentIndex == onboardingPages.length - 1
                      //             ? "Let's start !"
                      //             : "Next",
                      //         style: TextStyle(
                      //           color: AppColors.white,
                      //           fontSize: width * 0.04,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingData {
  final String image, title, description;

  _OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}