import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/core/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/routes/app_route.gr.dart';
import '../../../../../home/data/models/productModel/product_model.dart';
import '../../../../../home/presentation/pages/widgets/custom_button_add_cart.dart';
import '../../../../river_pod/favorite_river_pod.dart';

class ProductCardGrid extends ConsumerWidget {
  const ProductCardGrid({super.key, required this.finalList});

  final List<ProductModel> finalList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);
    final favoriteNotifier = ref.read(favoriteProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: finalList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final item = finalList[index];
          final isFavorite = favorites.contains(item.id);

          return GestureDetector(
            onTap: () {
              context.pushRoute(ProductDetailsRoute(product: item));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.network(
                          item.image,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            '50% Off.',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 10,
                        child: GestureDetector(
                          onTap: () async {
                            await favoriteNotifier.toggleFavorite(item);

                            final nowFavorite =
                            favoriteNotifier.isExist(item);

                            CustomSnackBar.show(
                              context,
                              message: nowFavorite
                                  ? "The product has been added to favorites"
                                  : "The product has been removed from favorites",
                              backgroundColor: nowFavorite
                                  ? Colors.green
                                  : Colors.redAccent,
                              icon: nowFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              "${item.price} L.E",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${item.oldPrice} L.E.',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 14,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              item.rating,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '(${item.reviewCount})',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomButtonAddCart(product: item, h: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
