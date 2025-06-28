import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';
import '../../../data/models/home_model/sections_model.dart';

class CustomCate extends StatelessWidget {
  const CustomCate({super.key, required this.item});

  final itemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(item.image),
        SizedBox(height: 10),
        Text(item.title, style: Styles.textStyle12bold),
      ],
    );
  }
}