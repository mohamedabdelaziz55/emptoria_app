
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: h * 0.35,
        width: w * 0.5,
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
            mainAxisSize: MainAxisSize.min,
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
              SizedBox(height: 20,),
              Flexible(
                child: TextButton(

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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
