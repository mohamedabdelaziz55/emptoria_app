import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_offer_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [CustomAppBar(), CustomOfferCard()]),
      ),
    );
  }
}
