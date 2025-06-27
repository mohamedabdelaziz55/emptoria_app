
import 'package:flutter/material.dart';

import '../../../../../core/assets.dart';
import '../../../../../core/styles.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.24,
      width: w * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsData.offerCard),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "50-40%",
              style: Styles.textStyle24bold.copyWith(color: Colors.white),
            ),
            Text(
              "OFF",
              style: Styles.textStyle24bold.copyWith(color: Colors.white),
            ),
            Text(
              "Now in",
              style: Styles.textStyle14.copyWith(color: Colors.white),
            ),
            Text(
              "(product) All colours",
              style: Styles.textStyle14.copyWith(color: Colors.white),
            ),
            SizedBox(height: 12,),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Shop Now ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
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
