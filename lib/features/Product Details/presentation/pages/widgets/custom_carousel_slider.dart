import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../home/data/models/productModel/product_model.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key, required this.product});
  final ProductModel product;
  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}
class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      widget.product.image,
      widget.product.image,
      widget.product.image
    ];

    return Column(
      children: [
        CarouselSlider(
          items: images.map((img) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                img,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 270,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, _) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? kPC : Colors.grey.shade300,
              ),
            );
          }),
        ),
      ],
    );
  }
}
