import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/data/models/productModel/product_model.dart';

class CustomTapBar extends StatefulWidget {
  const CustomTapBar({super.key, required this.product});

  final ProductModel product;

  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}

class _CustomTapBarState extends State<CustomTapBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  bool _showAllReviews = false;
  final sizes = ["6 UK", "7 UK", "8 UK", "9 UK"];
  final colors = [
    Colors.white,
    Colors.grey,
    Colors.brown,
    Colors.blueGrey,
    Colors.black,
  ];
  String selectedSize = "7 UK";
  Color selectedColor = Colors.black;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Column(
      children: [
        TabBar(
          dividerColor: Colors.transparent,
          controller: tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: [
            const Tab(text: "Details"),
            Tab(text: "Reviews(${product.reviewCount})"),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 350,
          child: TabBarView(
            controller: tabController,
            children: [detailsTab(product), reviewsTab()],
          ),
        ),
      ],
    );
  }

  Widget detailsTab(ProductModel product) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RatingBarIndicator(
                rating: double.tryParse(product.rating) ?? 0.0,
                itemBuilder: (context, index) =>
                const Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 18.0,
                direction: Axis.horizontal,
              ),
              const SizedBox(width: 8),
              Text(
                product.reviewCount,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "Size: ",
                style: Styles.textStyle16bold.copyWith(color: kPC),
              ),
              const SizedBox(width: 8),
              Row(
                children: sizes.map((size) {
                  final isSelected = size == selectedSize;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedSize = size),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: isSelected ? Colors.blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "Color: ",
                style: Styles.textStyle16bold.copyWith(color: kPC),
              ),
              const SizedBox(width: 8),
              Row(
                children: colors.map((color) {
                  final isSelected = color == selectedColor;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedColor = color),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: color,
                          border: Border.all(
                            color: isSelected
                                ? Colors.blue
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Description:",
            style: Styles.textStyle16bold.copyWith(color: kPC),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: Styles.textStyle14.copyWith(color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget reviewsTab() {

    final visibleReviews = _showAllReviews ? reviews : reviews.take(2).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          ...visibleReviews.map((review) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(review["image"] as String),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    review["name"] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    review["date"] as String,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  RatingBarIndicator(
                    rating: review["rating"] as double,
                    itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 18.0,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    review["text"] as String,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            );
          }),
          if (!_showAllReviews && reviews.length > 2)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => setState(() => _showAllReviews = true),
                child: const Text(
                  "View all",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

 List<dynamic> reviews = [
{
"name": "Mohamed Elsafty",
"image": "https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/...",
"rating": 3.0,
"date": "25 April, 2023",
"text":
"This one is a perfect choice for everyday wear. I love it 🖤🖤🖤",
},
{
"name": "Mohamed Elsafty",
"image": "https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/...",
"rating": 5.0,
"date": "25 April, 2023",
"text":
"This one is a perfect choice for everyday wear. I love it 🖤🖤🖤",
},
{
"name": "Mohamed Elsafty",
"image": "https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/...",
"rating": 4.0,
"date": "15 March, 2023",
"text": "It's amazing colors and print as usual.. 🖤",
},
];