import 'package:emptoria_app_team/features/favorites/date/Provider/favorite_provider.dart';
import 'package:emptoria_app_team/routes/app_route.dart';
import 'package:emptoria_app_team/themes/app_theme.dart';
import 'package:emptoria_app_team/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MyApp());
}
//test
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

        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,

        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,

      ),
    );
  }
}
