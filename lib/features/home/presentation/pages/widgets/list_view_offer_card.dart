import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import 'custom_offer_card.dart';

class PageViewOfferCard extends StatefulWidget {
  const PageViewOfferCard({super.key});

  @override
  State<PageViewOfferCard> createState() => _PageViewOfferCardState();
}

class _PageViewOfferCardState extends State<PageViewOfferCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;

    return SizedBox(
      height: h * 0.32 + 0,
      child: Column(
        children: [
          SizedBox(
            height: h * 0.27,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return const CustomOfferCard();
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? kPC : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}