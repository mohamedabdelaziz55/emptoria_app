import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/custom_snack_bar.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../favorites/river_pod/favorite_river_pod.dart';
import '../../../../home/data/models/productModel/product_model.dart';

class CustomRowSeller extends ConsumerWidget {
  const CustomRowSeller({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);
    final favoriteNotifier = ref.read(favoriteProvider.notifier);

    final isFavorite = favorites.contains(product.id);

    return Row(
      children: [
        const SizedBox(width: 10),
        Text("${product.price} L.E", style: Styles.textStyle16bold),
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
        const SizedBox(width: 10),
        CircularIconButton(
          icon: isFavorite ? Icons.favorite : Icons.favorite_border,
          borderColor: kPC,
          iconColor: Colors.red,
          onPressed: () async {
            await favoriteNotifier.toggleFavorite(product);

            final nowFavorite = favoriteNotifier.isExist(product);

            CustomSnackBar.show(
              context,
              message: nowFavorite
                  ? "The product has been added to favorites"
                  : "The product has been removed from favorites",
              backgroundColor: Colors.white,
              icon: nowFavorite ? Icons.favorite : Icons.favorite_border,
            );
          },
        ),
      ],
    );
  }
}

//--------------------------------Elsafty----//

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
