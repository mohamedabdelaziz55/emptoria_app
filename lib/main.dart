import 'package:emptoria_app_team/features/favorites/date/Provider/favorite_provider.dart';
import 'package:emptoria_app_team/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>FavoriteProvider())
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.grey
          )
        ),
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
