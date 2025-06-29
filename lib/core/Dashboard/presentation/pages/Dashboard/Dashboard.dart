import 'package:auto_route/annotations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../features/favorites/presentation/pages/favorites_page/favorites_page.dart';
import '../../../../../features/home/presentation/pages/home_page/home_page.dart';
import '../../../../../features/home/presentation/pages/widgets/home_view_body.dart';
import '../../../../constants/constants.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    const HomePage(),
    const ScerchPage(),
    const FavoritesPage(),
    const CartPAge(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(Icons.home_outlined, size: 30, color: index == 0 ? Colors.white : Colors.grey),
      Icon(Icons.search, size: 30, color: index == 1 ? Colors.white : Colors.grey),
      Icon(Icons.favorite_border, size: 30, color: index == 2 ? Colors.white : Colors.grey),
      Icon(Icons.shopping_cart_outlined, size: 30, color: index == 3 ? Colors.white : Colors.grey),
      Icon(Icons.person, size: 30, color: index == 4 ? Colors.white : Colors.grey),
    ];

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: CurvedNavigationBar(
            key: navigationKey,
            backgroundColor: Colors.transparent,
            color: Colors.white,
            buttonBackgroundColor: kPC,
            height: 70,
            index: index,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            items: items,
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
        body: screens[index],
      ),
    );
  }
}
