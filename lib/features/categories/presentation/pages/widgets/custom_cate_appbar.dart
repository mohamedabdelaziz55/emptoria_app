import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/routes/app_route.gr.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/pages/widgets/custom_app_bar.dart';

class CustomCateAppBar extends StatelessWidget {
  const CustomCateAppBar({
    super.key,
    required this.title,
    this.icon,
    this.onPressed, required this.showRow,
  });
final bool showRow;
  final String title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: h * 0.09,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: onPressed, icon: Icon(icon)),
            Text(title, style: Styles.textStyle24bold),
           showRow==true? IconAppBar(onTap: (){
             context.pushRoute(DashboardRoute(i: 2));
           },icon: Icons.shopping_cart_outlined):Text('             '),
          ],
        ),
      ),
    );
  }
}
