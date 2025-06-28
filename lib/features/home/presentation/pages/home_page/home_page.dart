import 'package:auto_route/annotations.dart';
import 'package:emptoria_app_team/features/home/presentation/pages/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}
