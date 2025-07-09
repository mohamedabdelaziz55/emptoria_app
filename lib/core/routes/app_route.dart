import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: OnboardingRoute.page, path: '/onBoarding'),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: SignUpRoute.page, path: '/signup'),
    AutoRoute(page: ForgotPasswordFlow.page, path: '/forgetPassword'),
    AutoRoute(page: DashboardRoute.page, path: '/dashboard'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: CartRoute.page, path: '/cart'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: CategoriesRoute.page, path: '/categories'),
    AutoRoute(page: FavoritesRoute.page, path: '/favorites'),
    AutoRoute(page: ProductDetailsRoute.page, path: '/productDetails'),

  ];
}
