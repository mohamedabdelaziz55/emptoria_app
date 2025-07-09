import 'package:emptoria_app_team/features/home/data/models/productModel/product_model.dart';
import 'package:flutter/material.dart';
import '../../../../home/presentation/pages/widgets/list_view_product_card.dart';
import '../../../../home/presentation/pages/widgets/row_text_and_view.dart';
import 'custom_carousel_slider.dart';
import 'custom_row_seller.dart';
import 'custom_tap_bar.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCarouselSlider(product: product),
          const SizedBox(height: 16),
          CustomRowSeller(product: product),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                CustomTapBar(product: product),
                RowTextandView(text1: 'RECOMMENDED', text2: 'FOR YOU'),
                ListViewProductCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


