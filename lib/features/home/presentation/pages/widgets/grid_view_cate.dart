import 'package:flutter/material.dart';

import '../../../data/models/home_model/sections_model.dart';
import 'custom_cate.dart';

class GridViewCate extends StatelessWidget {
  const GridViewCate({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cateItem.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 25,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        return CustomCate(item: cateItem[index]);
      },
    );
  }
}

