import 'package:auto_route/annotations.dart';
import 'package:emptoria_app_team/features/favorites/presentation/pages/favorites_page/widgets/favorites_page_body.dart';
import 'package:flutter/material.dart';

@RoutePage()

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: FavoritesPageBody()) ,
    );
  }
}