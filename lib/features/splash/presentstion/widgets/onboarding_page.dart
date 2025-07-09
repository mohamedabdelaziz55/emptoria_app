import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class OnboardingPage extends StatelessWidget {
  final dynamic data;
  final double width;
  final double height;

  const OnboardingPage({
    super.key,
    required this.data,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08, vertical: height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.08),
            Image.asset(data.image, height: height * 0.35),
            SizedBox(height: height * 0.06),
            Text(
              data.title,
              style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.bold),
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
  }
}