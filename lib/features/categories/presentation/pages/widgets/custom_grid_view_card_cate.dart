import 'package:flutter/material.dart';

import '../../../../home/presentation/pages/widgets/product_card.dart';

class CustomGridViewCardCate extends StatelessWidget {
  const CustomGridViewCardCate({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.4 / 4,
      ),
      itemBuilder: (context, index) {
        return const ProductCard();
      },
    );
  }
}