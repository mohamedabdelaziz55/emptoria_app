import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/custom_snack_bar.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../favorites/date/Provider/favorite_provider.dart';
import '../../../../home/data/models/productModel/product_model.dart';

class CustomRowSeller extends StatefulWidget {
  const CustomRowSeller({super.key, required this.product});

  final ProductModel product;

  @override
  State<CustomRowSeller> createState() => _CustomRowSellerState();
}

class _CustomRowSellerState extends State<CustomRowSeller> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);

    return Row(
      children: [
        const SizedBox(width: 10),
        Text("${widget.product.price} L.E", style: Styles.textStyle16bold),
        const SizedBox(width: 10),
        Column(
          children: [
            Text("50%Off", style: Styles.textStyle12bold.copyWith(color: kPC)),
            Text(
              widget.product.oldPrice,
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
        SizedBox(width: 10),
        CircularIconButton(
          icon: provider.isExist(widget.product)
              ? Icons.favorite
              : Icons.favorite_border,

          borderColor: kPC,
          iconColor: Colors.red,
          onPressed:   () {
    provider.toggleFavorite(widget.product);
    setState(() {});
    CustomSnackBar.show(
    context,
    message: provider.isExist(widget.product)
    ? "The product has been added to favorites"
        : "The product has been removed from favorites",
    backgroundColor: provider.isExist(widget.product)
    ? Colors.green
        : Colors.redAccent,
    icon: provider.isExist(widget.product)
    ? Icons.favorite
        : Icons.favorite_border,
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
