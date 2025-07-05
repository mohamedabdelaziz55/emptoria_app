import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Dashboard.page, path: '/'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(
      page: CategoriesRoute.page,
      path: '/categories',
    ),  ];
}