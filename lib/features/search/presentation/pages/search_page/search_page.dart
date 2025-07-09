import 'package:auto_route/annotations.dart';
import 'package:emptoria_app_team/features/home/presentation/pages/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

import '../widgets/search_view_body.dart';
@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      SearchViewBody(),
    );


  }
}
