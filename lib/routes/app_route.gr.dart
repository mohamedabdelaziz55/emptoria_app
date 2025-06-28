// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:emptoria_app_team/core/Dashboard/presentation/pages/Dashboard/Dashboard.dart'
    as _i2;
import 'package:emptoria_app_team/features/categories/presentation/pages/categories_page/categories.dart'
    as _i1;
import 'package:emptoria_app_team/features/home/presentation/pages/home_page/home_page.dart'
    as _i3;

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesRoute extends _i4.PageRouteInfo<void> {
  const CategoriesRoute({List<_i4.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CategoriesPage();
    },
  );
}

/// generated route for
/// [_i2.Dashboard]
class Dashboard extends _i4.PageRouteInfo<void> {
  const Dashboard({List<_i4.PageRouteInfo>? children})
    : super(Dashboard.name, initialChildren: children);

  static const String name = 'Dashboard';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.Dashboard();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}
