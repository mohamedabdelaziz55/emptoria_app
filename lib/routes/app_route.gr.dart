// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:collection/collection.dart' as _i7;
import 'package:emptoria_app_team/core/Dashboard/presentation/pages/Dashboard/Dashboard.dart'
    as _i2;
import 'package:emptoria_app_team/features/categories/presentation/pages/categories_page/categories.dart'
    as _i1;
import 'package:emptoria_app_team/features/home/data/models/productModel/product_model.dart'
    as _i6;
import 'package:emptoria_app_team/features/home/presentation/pages/home_page/home_page.dart'
    as _i3;
import 'package:flutter/material.dart' as _i5;

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesRoute extends _i4.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i5.Key? key,
    required List<_i6.ProductModel> filteredProduct,
    required String title,
    List<_i4.PageRouteInfo>? children,
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

  static _i4.PageInfo page = _i4.PageInfo(
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

  final _i5.Key? key;

  final List<_i6.ProductModel> filteredProduct;

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
        const _i7.ListEquality().equals(
          filteredProduct,
          other.filteredProduct,
        ) &&
        title == other.title;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i7.ListEquality().hash(filteredProduct) ^
      title.hashCode;
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
