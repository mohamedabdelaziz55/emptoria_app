import 'package:flutter/cupertino.dart';

import '../../../../../categories/presentation/pages/widgets/custom_cate_appbar.dart';

class FavoritesPageBody extends StatelessWidget {
  const FavoritesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCateAppBar(title: 'Favorites'),
      ],
    );
  }
}
