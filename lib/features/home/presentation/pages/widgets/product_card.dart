import 'package:emptoria_app_team/features/favorites/date/Provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/productModel/product_model.dart';
import 'custom_button_add_cart.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Container(
      width: 180,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child:Image(image: NetworkImage(widget.product.image),width: double.infinity,height: 120,fit: BoxFit.cover,)
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "50% Off.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      provider.toggleFavorite(widget.product);
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      provider.isExist(widget.product)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: Styles.textStyle14bold,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.product.description,
                    style: Styles.textStyle12.copyWith(color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        widget.product.price,
                        style: Styles.textStyle14bold,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.product.oldPrice,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(widget.product.rating, style: Styles.textStyle12),
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        widget.product.reviewCount,
                        style: Styles.textStyle12.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButtonAddCart(product: widget.product,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


