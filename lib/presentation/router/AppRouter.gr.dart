// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:ecommerce_app/model/category.dart' as _i20;
import 'package:ecommerce_app/presentation/loading/loading.dart' as _i8;
import 'package:ecommerce_app/presentation/router/gr_auto_router.dart' as _i4;
import 'package:ecommerce_app/presentation/screen/forgot_password/forgot_password.dart'
    as _i6;
import 'package:ecommerce_app/presentation/screen/login/login_screen.dart'
    as _i9;
import 'package:ecommerce_app/presentation/screen/main/bag/bag_screen.dart'
    as _i1;
import 'package:ecommerce_app/presentation/screen/main/favorites/favorites_screen.dart'
    as _i3;
import 'package:ecommerce_app/presentation/screen/main/home/home_screen.dart'
    as _i7;
import 'package:ecommerce_app/presentation/screen/main/main_screen.dart'
    as _i10;
import 'package:ecommerce_app/presentation/screen/main/profile/profile_screen.dart'
    as _i12;
import 'package:ecommerce_app/presentation/screen/main/shop/branch/branch.dart'
    as _i2;
import 'package:ecommerce_app/presentation/screen/main/shop/filters_product/filters_product.dart'
    as _i5;
import 'package:ecommerce_app/presentation/screen/main/shop/product_category/product_category.dart'
    as _i11;
import 'package:ecommerce_app/presentation/screen/main/shop/shop_screen.dart'
    as _i13;
import 'package:ecommerce_app/presentation/screen/main/shop/shop_search/shop_search.dart'
    as _i14;
import 'package:ecommerce_app/presentation/screen/signup/signup_screen.dart'
    as _i15;
import 'package:ecommerce_app/presentation/splash/splash.dart' as _i16;
import 'package:flutter/cupertino.dart' as _i18;
import 'package:flutter/material.dart' as _i19;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    BagRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BagScreen(),
      );
    },
    Branch.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Branch(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FavoritesScreen(),
      );
    },
    FiltersNavigation.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FiltersNavigation(),
      );
    },
    FiltersProduct.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.FiltersProduct(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ForgotPasswordScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.HomeScreen(key: args.key),
      );
    },
    Loading.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Loading(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.LoginScreen(key: args.key),
      );
    },
    MainRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MainScreen(),
      );
    },
    ProductCategory.name: (routeData) {
      final args = routeData.argsAs<ProductCategoryArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ProductCategory(
          key: args.key,
          title: args.title,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ProfileScreen(),
      );
    },
    ShopNavigation.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ShopNavigation(),
      );
    },
    ShopRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ShopScreen(),
      );
    },
    ShopSearch.name: (routeData) {
      final args = routeData.argsAs<ShopSearchArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.ShopSearch(
          key: args.key,
          listCategory: args.listCategory,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.SignUpScreen(key: args.key),
      );
    },
    Splash.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.Splash(),
      );
    },
  };
}

/// generated route for
/// [_i1.BagScreen]
class BagRoute extends _i17.PageRouteInfo<void> {
  const BagRoute({List<_i17.PageRouteInfo>? children})
      : super(
          BagRoute.name,
          initialChildren: children,
        );

  static const String name = 'BagRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Branch]
class Branch extends _i17.PageRouteInfo<void> {
  const Branch({List<_i17.PageRouteInfo>? children})
      : super(
          Branch.name,
          initialChildren: children,
        );

  static const String name = 'Branch';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FavoritesScreen]
class FavoritesRoute extends _i17.PageRouteInfo<void> {
  const FavoritesRoute({List<_i17.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FiltersNavigation]
class FiltersNavigation extends _i17.PageRouteInfo<void> {
  const FiltersNavigation({List<_i17.PageRouteInfo>? children})
      : super(
          FiltersNavigation.name,
          initialChildren: children,
        );

  static const String name = 'FiltersNavigation';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FiltersProduct]
class FiltersProduct extends _i17.PageRouteInfo<void> {
  const FiltersProduct({List<_i17.PageRouteInfo>? children})
      : super(
          FiltersProduct.name,
          initialChildren: children,
        );

  static const String name = 'FiltersProduct';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i17.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i17.PageInfo<ForgotPasswordRouteArgs> page =
      _i17.PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<HomeRouteArgs> page =
      _i17.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.Loading]
class Loading extends _i17.PageRouteInfo<void> {
  const Loading({List<_i17.PageRouteInfo>? children})
      : super(
          Loading.name,
          initialChildren: children,
        );

  static const String name = 'Loading';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i17.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<LoginRouteArgs> page =
      _i17.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.MainScreen]
class MainRoute extends _i17.PageRouteInfo<void> {
  const MainRoute({List<_i17.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProductCategory]
class ProductCategory extends _i17.PageRouteInfo<ProductCategoryArgs> {
  ProductCategory({
    _i19.Key? key,
    required String title,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ProductCategory.name,
          args: ProductCategoryArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductCategory';

  static const _i17.PageInfo<ProductCategoryArgs> page =
      _i17.PageInfo<ProductCategoryArgs>(name);
}

class ProductCategoryArgs {
  const ProductCategoryArgs({
    this.key,
    required this.title,
  });

  final _i19.Key? key;

  final String title;

  @override
  String toString() {
    return 'ProductCategoryArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ShopNavigation]
class ShopNavigation extends _i17.PageRouteInfo<void> {
  const ShopNavigation({List<_i17.PageRouteInfo>? children})
      : super(
          ShopNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ShopNavigation';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ShopScreen]
class ShopRoute extends _i17.PageRouteInfo<void> {
  const ShopRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShopRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ShopSearch]
class ShopSearch extends _i17.PageRouteInfo<ShopSearchArgs> {
  ShopSearch({
    _i19.Key? key,
    required List<_i20.Category> listCategory,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ShopSearch.name,
          args: ShopSearchArgs(
            key: key,
            listCategory: listCategory,
          ),
          initialChildren: children,
        );

  static const String name = 'ShopSearch';

  static const _i17.PageInfo<ShopSearchArgs> page =
      _i17.PageInfo<ShopSearchArgs>(name);
}

class ShopSearchArgs {
  const ShopSearchArgs({
    this.key,
    required this.listCategory,
  });

  final _i19.Key? key;

  final List<_i20.Category> listCategory;

  @override
  String toString() {
    return 'ShopSearchArgs{key: $key, listCategory: $listCategory}';
  }
}

/// generated route for
/// [_i15.SignUpScreen]
class SignUpRoute extends _i17.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i19.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i17.PageInfo<SignUpRouteArgs> page =
      _i17.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.Splash]
class Splash extends _i17.PageRouteInfo<void> {
  const Splash({List<_i17.PageRouteInfo>? children})
      : super(
          Splash.name,
          initialChildren: children,
        );

  static const String name = 'Splash';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
