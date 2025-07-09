import 'package:emptoria_app_team/features/favorites/date/Provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_route.dart';
import 'features/cart/presentation/data/cart_provider/cart_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final favoriteProvider = FavoriteProvider();
  await favoriteProvider.loadFavoritesFromPrefs();

  final cartProvider = CartProvider();
  await cartProvider.loadCartFromPrefs();

  runApp(
    MyApp(
      favoriteProvider: favoriteProvider,
      cartProvider: cartProvider,
    ),
  );
}
class MyApp extends StatelessWidget {
  final FavoriteProvider favoriteProvider;
  final CartProvider cartProvider;

  MyApp({super.key, required this.favoriteProvider, required this.cartProvider});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: favoriteProvider),
        ChangeNotifierProvider.value(value: cartProvider),
      ],
      child: MaterialApp.router(
        theme: ThemeData(iconTheme: IconThemeData(color: Colors.grey)),
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

