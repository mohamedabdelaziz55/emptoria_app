import 'package:emptoria_app_team/features/favorites/presentation/pages/favorites_page/widgets/favorites_page_body.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FavoritesPageBody() ,
    );
  }
}