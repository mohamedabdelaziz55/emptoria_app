import 'package:emptoria_app_team/core/constants/constants.dart';
import 'package:emptoria_app_team/core/utils/styles.dart';
import 'package:emptoria_app_team/features/home/data/models/productModel/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../home/presentation/pages/widgets/list_view_product_card.dart';
import '../../../../home/presentation/pages/widgets/row_text_and_view.dart';
import 'custom_carousel_slider.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody>
    with TickerProviderStateMixin {
  String selectedSize = "7 UK";
  Color selectedColor = Colors.black;
  bool _showAllReviews = false;
  final sizes = ["6 UK", "7 UK", "8 UK", "9 UK"];
  final colors = [
    Colors.white,
    Colors.grey,
    Colors.brown,
    Colors.blueGrey,
    Colors.black,
  ];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCarouselSlider(product: product),
          const SizedBox(height: 16),
          CustomRowSeller(product: product),
          const SizedBox(height: 20),

          /// Tabs: Details | Reviews
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TabBar(
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
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TabBarView(
                      controller: tabController,
                      children: [detailsTab(product), reviewsTab()],
                    ),
                  ),
                ),
                RowTextandView(text1: 'RECOMMENDED', text2: 'FOR YOU'),
                ListViewProductCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detailsTab(ProductModel product) {
    return Column(
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
            Text("Size: ", style: Styles.textStyle16bold.copyWith(color: kPC)),
            const SizedBox(height: 8),
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
            Text("Color: ", style: Styles.textStyle16bold.copyWith(color: kPC)),
            const SizedBox(height: 8),
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
                        shape: BoxShape.rectangle,
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
    );
  }

  Widget reviewsTab() {
    final reviews = [
      {
        "name": "Mohamed Elsafty",
        "image": "https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/515501119_2154320011703752_2156800624888698812_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHEK46KEtvPnwHvzOTmNML5LLHJyMk-t7QsscnIyT63tPcriAkZgzyTaBATkXLdmSZJOIyNfChszJJoFpic0zVH&_nc_ohc=hpFk1cYbXfYQ7kNvwHtGzwM&_nc_oc=AdmTi8SYZcTk7qyJ28dno9LH-GhDNRVqmo7ZjhqZ6MOu1P0Kl0-ccDq1KEwi7e9q8is&_nc_zt=23&_nc_ht=scontent.faly1-2.fna&_nc_gid=5OIJXLVyKHOUpYgxTTrNTQ&oh=00_AfRzH2DyF3Ey-EOrkofz46MVGfK7mBHkicEVfWhClyD8-g&oe=68735642",
        "rating": 3.0,
        "date": "25 April, 2023",
        "text": "This one is a perfect choice for everyday wear. I love it 🖤🖤🖤",
      },
      {
        "name": "Mohamed Elsafty",
        "image": "https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/515501119_2154320011703752_2156800624888698812_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHEK46KEtvPnwHvzOTmNML5LLHJyMk-t7QsscnIyT63tPcriAkZgzyTaBATkXLdmSZJOIyNfChszJJoFpic0zVH&_nc_ohc=hpFk1cYbXfYQ7kNvwHtGzwM&_nc_oc=AdmTi8SYZcTk7qyJ28dno9LH-GhDNRVqmo7ZjhqZ6MOu1P0Kl0-ccDq1KEwi7e9q8is&_nc_zt=23&_nc_ht=scontent.faly1-2.fna&_nc_gid=5OIJXLVyKHOUpYgxTTrNTQ&oh=00_AfRzH2DyF3Ey-EOrkofz46MVGfK7mBHkicEVfWhClyD8-g&oe=68735642",
        "rating": 5.0,
        "date": "25 April, 2023",
        "text": "This one is a perfect choice for everyday wear. I love it 🖤🖤🖤",
      },
      {
        "name": "Mohamed Elsafty",
        "image": "https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/515501119_2154320011703752_2156800624888698812_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHEK46KEtvPnwHvzOTmNML5LLHJyMk-t7QsscnIyT63tPcriAkZgzyTaBATkXLdmSZJOIyNfChszJJoFpic0zVH&_nc_ohc=hpFk1cYbXfYQ7kNvwHtGzwM&_nc_oc=AdmTi8SYZcTk7qyJ28dno9LH-GhDNRVqmo7ZjhqZ6MOu1P0Kl0-ccDq1KEwi7e9q8is&_nc_zt=23&_nc_ht=scontent.faly1-2.fna&_nc_gid=5OIJXLVyKHOUpYgxTTrNTQ&oh=00_AfRzH2DyF3Ey-EOrkofz46MVGfK7mBHkicEVfWhClyD8-g&oe=68735642",
        "rating": 4.0,
        "date": "15 March, 2023",
        "text": "It's amazing colors and print as usual.. 🖤",
      },
    ];

    final visibleReviews = _showAllReviews ? reviews : reviews.take(2).toList();

    return  SingleChildScrollView(
      child: Column(
        children: [
          ...visibleReviews.map((review) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(review["image"] as String),
                backgroundColor: Colors.grey[200],
                onBackgroundImageError: (_, __) {}, // لتجنب الكراش عند فشل التحميل
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
                    itemBuilder: (context, index) =>
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
          }).toList(),
          if (!_showAllReviews && reviews.length > 2)
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _showAllReviews = true;
                  });
                },
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

class CustomRowSeller extends StatelessWidget {
  const CustomRowSeller({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Text(product.price, style: Styles.textStyle16bold),
        const SizedBox(width: 10),
        Column(
          children: [
            Text("50%Off", style: Styles.textStyle12bold.copyWith(color: kPC)),
            Text(
              product.oldPrice,
              style: Styles.textStyle14.copyWith(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        const SizedBox(width: 130),
        CircularIconButton(
          icon: Icons.share,
          borderColor: kPC,
          iconColor: kPC,
          onPressed: () {
            // share logic
          },
        ),
        SizedBox(width: 10,),
        CircularIconButton(
          icon: Icons.favorite_border,
          borderColor: kPC,
          iconColor: kPC,
          onPressed: () {
            // favorite logic
          },
        ),
      ],
    );
  }
}


class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final Color borderColor;
  final Color iconColor;
  final VoidCallback onPressed;
  final double size;
  final double iconSize;

  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.borderColor = Colors.blue,
    this.iconColor = Colors.blue,
    this.size = 40,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: iconColor, size: iconSize),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
    );
  }
}
