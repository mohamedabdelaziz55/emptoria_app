import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';
import '../../../../home/presentation/pages/widgets/custom_app_bar.dart';

class CustomCateAppBar extends StatelessWidget {
  const CustomCateAppBar({super.key, required this.title});
  final String title;
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
            IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(CupertinoIcons.back),
            ),
            Text(title, style: Styles.textStyle24bold),
            const IconAppBar(image: 'assets/icons/Vector (1).png'),
          ],
        ),
      ),
    )
    ;
  }
}
