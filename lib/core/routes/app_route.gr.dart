// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:collection/collection.dart' as _i13;
import 'package:emptoria_app_team/core/Dashboard/presentation/pages/Dashboard/Dashboard.dart'
    as _i2;
import 'package:emptoria_app_team/features/auth/presentation/pages/forget_password.dart'
    as _i3;
import 'package:emptoria_app_team/features/auth/presentation/pages/login_screen.dart'
    as _i5;
import 'package:emptoria_app_team/features/auth/presentation/pages/sign_up_screen.dart'
    as _i8;
import 'package:emptoria_app_team/features/categories/presentation/pages/categories_page/categories.dart'
    as _i1;
import 'package:emptoria_app_team/features/home/data/models/productModel/product_model.dart'
    as _i12;
import 'package:emptoria_app_team/features/home/presentation/pages/home_page/home_page.dart'
    as _i4;
import 'package:emptoria_app_team/features/search/presentation/pages/search_page/search_page.dart'
    as _i7;
import 'package:emptoria_app_team/features/splash/presentstion/pages/on_boarding.dart'
    as _i6;
import 'package:emptoria_app_team/features/splash/presentstion/pages/splash_screen.dart'
    as _i9;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesRoute extends _i10.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i11.Key? key,
    required List<_i12.ProductModel> filteredProduct,
    required String title,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         CategoriesRoute.name,
         args: CategoriesRouteArgs(
           key: key,
           filteredProduct: filteredProduct,
           title: title,
         ),
         initialChildren: children,
       );

  static const String name = 'CategoriesRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoriesRouteArgs>();
      return _i1.CategoriesPage(
        key: args.key,
        filteredProduct: args.filteredProduct,
        title: args.title,
      );
    },
  );
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({
    this.key,
    required this.filteredProduct,
    required this.title,
  });

  final _i11.Key? key;

  final List<_i12.ProductModel> filteredProduct;

  final String title;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key, filteredProduct: $filteredProduct, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoriesRouteArgs) return false;
    return key == other.key &&
        const _i13.ListEquality().equals(
          filteredProduct,
          other.filteredProduct,
        ) &&
        title == other.title;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i13.ListEquality().hash(filteredProduct) ^
      title.hashCode;
}

/// generated route for
/// [_i2.Dashboard]
class Dashboard extends _i10.PageRouteInfo<void> {
  const Dashboard({List<_i10.PageRouteInfo>? children})
    : super(Dashboard.name, initialChildren: children);

  static const String name = 'Dashboard';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.Dashboard();
    },
  );
}

/// generated route for
/// [_i3.ForgotPasswordFlow]
class ForgotPasswordFlow extends _i10.PageRouteInfo<void> {
  const ForgotPasswordFlow({List<_i10.PageRouteInfo>? children})
    : super(ForgotPasswordFlow.name, initialChildren: children);

  static const String name = 'ForgotPasswordFlow';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.ForgotPasswordFlow();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginScreen();
    },
  );
}

/// generated route for
/// [_i6.OnboardingScreen]
class OnboardingRoute extends _i10.PageRouteInfo<void> {
  const OnboardingRoute({List<_i10.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i7.SearchPage]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute({List<_i10.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.SearchPage();
    },
  );
}

/// generated route for
/// [_i8.SignUpScreen]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute({List<_i10.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashScreen();
    },
  );
}
