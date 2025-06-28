import 'package:emptoria_app_team/features/home/presentation/pages/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ListViewProductCard extends StatelessWidget {
  const ListViewProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 8,
              right: index == 5 ? 16 : 0,
            ),
            child: const ProductCard(),
          );
        },
      ),
    );
  }
}
