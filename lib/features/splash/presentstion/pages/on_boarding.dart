import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/routes/app_route.gr.dart';
import '../widgets/onboarding_dotsIndicator.dart';
import '../widgets/onboarding_navigation_buttons.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/skip_button.dart';

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
                return OnboardingPage(
                  data: onboardingPages[index],
                  width: width,
                  height: height,
                );
              },
            ),
            if (_currentIndex < onboardingPages.length - 1)
              SkipButton(width: width),
            Positioned(
              bottom: height * 0.03,
              left: width * 0.05,
              right: width * 0.05,
              child: Column(
                children: [
                  OnboardingDotsIndicator(
                    count: onboardingPages.length,
                    currentIndex: _currentIndex,
                    width: width,
                    height: height,
                  ),
                  SizedBox(height: height * 0.08),
                  OnboardingNavigationButtons(
                    currentIndex: _currentIndex,
                    total: onboardingPages.length,
                    width: width,
                    height: height,
                    onNext: _nextPage,
                    onBack: _previousPage,
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
