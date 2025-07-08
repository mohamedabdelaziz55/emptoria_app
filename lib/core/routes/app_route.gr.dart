// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:collection/collection.dart' as _i17;
import 'package:emptoria_app_team/core/Dashboard/presentation/pages/Dashboard/Dashboard.dart'
    as _i3;
import 'package:emptoria_app_team/features/auth/presentation/pages/forget_password.dart'
    as _i5;
import 'package:emptoria_app_team/features/auth/presentation/pages/login_screen.dart'
    as _i7;
import 'package:emptoria_app_team/features/auth/presentation/pages/sign_up_screen.dart'
    as _i12;
import 'package:emptoria_app_team/features/cart/presentation/pages/CartPage/cart_page.dart'
    as _i1;
import 'package:emptoria_app_team/features/categories/presentation/pages/categories_page/categories.dart'
    as _i2;
import 'package:emptoria_app_team/features/favorites/presentation/pages/favorites_page/favorites_page.dart'
    as _i4;
import 'package:emptoria_app_team/features/home/data/models/productModel/product_model.dart'
    as _i16;
import 'package:emptoria_app_team/features/home/presentation/pages/home_page/home_page.dart'
    as _i6;
import 'package:emptoria_app_team/features/Product%20Details/presentation/pages/product_page/product_details_screen.dart'
    as _i9;
import 'package:emptoria_app_team/features/profile/presentation/pages/profile_page.dart'
    as _i10;
import 'package:emptoria_app_team/features/search/presentation/pages/search_page/search_page.dart'
    as _i11;
import 'package:emptoria_app_team/features/splash/presentstion/pages/on_boarding.dart'
    as _i8;
import 'package:emptoria_app_team/features/splash/presentstion/pages/splash_screen.dart'
    as _i13;
import 'package:flutter/material.dart' as _i15;

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i14.PageRouteInfo<void> {
  const CartRoute({List<_i14.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.CartPage();
    },
  );
}

/// generated route for
/// [_i2.CategoriesPage]
class CategoriesRoute extends _i14.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i15.Key? key,
    required List<_i16.ProductModel> filteredProduct,
    required String title,
    List<_i14.PageRouteInfo>? children,
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

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoriesRouteArgs>();
      return _i2.CategoriesPage(
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

  final _i15.Key? key;

  final List<_i16.ProductModel> filteredProduct;

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
        const _i17.ListEquality().equals(
          filteredProduct,
          other.filteredProduct,
        ) &&
        title == other.title;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i17.ListEquality().hash(filteredProduct) ^
      title.hashCode;
}

/// generated route for
/// [_i3.Dashboard]
class Dashboard extends _i14.PageRouteInfo<void> {
  const Dashboard({List<_i14.PageRouteInfo>? children})
    : super(Dashboard.name, initialChildren: children);

  static const String name = 'Dashboard';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.Dashboard();
    },
  );
}

/// generated route for
/// [_i4.FavoritesPage]
class FavoritesRoute extends _i14.PageRouteInfo<void> {
  const FavoritesRoute({List<_i14.PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.FavoritesPage();
    },
  );
}

/// generated route for
/// [_i5.ForgotPasswordFlow]
class ForgotPasswordFlow extends _i14.PageRouteInfo<void> {
  const ForgotPasswordFlow({List<_i14.PageRouteInfo>? children})
    : super(ForgotPasswordFlow.name, initialChildren: children);

  static const String name = 'ForgotPasswordFlow';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.ForgotPasswordFlow();
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomePage();
    },
  );
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginScreen();
    },
  );
}

/// generated route for
/// [_i8.OnboardingScreen]
class OnboardingRoute extends _i14.PageRouteInfo<void> {
  const OnboardingRoute({List<_i14.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i9.ProductDetailsScreen]
class ProductDetailsRoute extends _i14.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i15.Key? key,
    required _i16.ProductModel product,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i9.ProductDetailsScreen(key: args.key, product: args.product);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final _i15.Key? key;

  final _i16.ProductModel product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsRouteArgs) return false;
    return key == other.key && product == other.product;
  }

  @override
  int get hashCode => key.hashCode ^ product.hashCode;
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfilePage();
    },
  );
}

/// generated route for
/// [_i11.SearchPage]
class SearchRoute extends _i14.PageRouteInfo<void> {
  const SearchRoute({List<_i14.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.SearchPage();
    },
  );
}

/// generated route for
/// [_i12.SignUpScreen]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute({List<_i14.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i13.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.SplashScreen();
    },
  );
}
