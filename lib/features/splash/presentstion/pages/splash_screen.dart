import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/routes/app_route.gr.dart';
import '../../../../main.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isPortrait = media.orientation == Orientation.portrait;
    final screenHeight = isPortrait ? media.size.height : media.size.width;

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/icons/Flow.json',
          width: screenHeight,
          height: screenHeight,
          repeat: false,
          animate: true,
          onLoaded: (composition) async {
            await Future.delayed(composition.duration);

            final userId = sp.getString('user_id');
            if (userId != null && userId.isNotEmpty) {
              context.replaceRoute( DashboardRoute());
            } else {
              context.replaceRoute(const OnboardingRoute());
            }
          },
        ),
      ),
    );
  }
}
