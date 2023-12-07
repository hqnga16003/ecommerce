// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:ecommerce_app/model/category.dart' as _i31;
import 'package:ecommerce_app/model/product.dart' as _i32;
import 'package:ecommerce_app/model/review_product.dart' as _i33;
import 'package:ecommerce_app/presentation/loading/loading.dart' as _i11;
import 'package:ecommerce_app/presentation/router/gr_auto_router.dart' as _i7;
import 'package:ecommerce_app/presentation/screen/chat/chat.dart' as _i4;
import 'package:ecommerce_app/presentation/screen/forgot_password/forgot_password.dart'
    as _i9;
import 'package:ecommerce_app/presentation/screen/login/login_screen.dart'
    as _i12;
import 'package:ecommerce_app/presentation/screen/main/bag/add_address/add_address.dart'
    as _i1;
import 'package:ecommerce_app/presentation/screen/main/bag/bag_screen.dart'
    as _i2;
import 'package:ecommerce_app/presentation/screen/main/bag/checkout/check_out.dart'
    as _i5;
import 'package:ecommerce_app/presentation/screen/main/bag/payment_methods/payment_methods.dart'
    as _i16;
import 'package:ecommerce_app/presentation/screen/main/bag/shipping_addresses/shipping_addresses.dart'
    as _i22;
import 'package:ecommerce_app/presentation/screen/main/bag/success/success.dart'
    as _i27;
import 'package:ecommerce_app/presentation/screen/main/favorites/favorites_screen.dart'
    as _i6;
import 'package:ecommerce_app/presentation/screen/main/home/home_screen.dart'
    as _i10;
import 'package:ecommerce_app/presentation/screen/main/main_screen.dart'
    as _i13;
import 'package:ecommerce_app/presentation/screen/main/product_detail/product_detail.dart'
    as _i18;
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/my_orders.dart'
    as _i14;
import 'package:ecommerce_app/presentation/screen/main/profile/order_detail/order_detail.dart'
    as _i15;
import 'package:ecommerce_app/presentation/screen/main/profile/profile_screen.dart'
    as _i19;
import 'package:ecommerce_app/presentation/screen/main/profile/settings/settings.dart'
    as _i21;
import 'package:ecommerce_app/presentation/screen/main/rating_reviews/rating_reviews.dart'
    as _i20;
import 'package:ecommerce_app/presentation/screen/main/shop/branch/brand.dart'
    as _i3;
import 'package:ecommerce_app/presentation/screen/main/shop/filters_product/filters_product.dart'
    as _i8;
import 'package:ecommerce_app/presentation/screen/main/shop/product_category/product_category.dart'
    as _i17;
import 'package:ecommerce_app/presentation/screen/main/shop/shop_screen.dart'
    as _i23;
import 'package:ecommerce_app/presentation/screen/main/shop/shop_search/shop_search.dart'
    as _i24;
import 'package:ecommerce_app/presentation/screen/signup/signup_screen.dart'
    as _i25;
import 'package:ecommerce_app/presentation/splash/splash.dart' as _i26;
import 'package:flutter/cupertino.dart' as _i29;
import 'package:flutter/material.dart' as _i30;

abstract class $AppRouter extends _i28.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    AddAddress.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddAddress(),
      );
    },
    BagRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BagScreen(),
      );
    },
    Brand.name: (routeData) {
      final args = routeData.argsAs<BrandArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.Brand(
          key: args.key,
          brands: args.brands,
        ),
      );
    },
    Chat.name: (routeData) {
      final args = routeData.argsAs<ChatArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.Chat(
          key: args.key,
          currentUserId: args.currentUserId,
          friendUid: args.friendUid,
          friendName: args.friendName,
        ),
      );
    },
    CheckoutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CheckoutScreen(
          key: args.key,
          totalPrice: args.totalPrice,
        ),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.FavoritesScreen(),
      );
    },
    FiltersNavigation.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FiltersNavigation(),
      );
    },
    FiltersProduct.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.FiltersProduct(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ForgotPasswordScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.LoadingScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.LoginScreen(key: args.key),
      );
    },
    MainRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MainScreen(),
      );
    },
    MyOrders.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.MyOrders(),
      );
    },
    OrderDetail.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OrderDetail(),
      );
    },
    PaymentMethods.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentMethods(),
      );
    },
    ProductCategory.name: (routeData) {
      final args = routeData.argsAs<ProductCategoryArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.ProductCategory(
          key: args.key,
          title: args.title,
          listCategory: args.listCategory,
        ),
      );
    },
    ProductDetail.name: (routeData) {
      final args = routeData.argsAs<ProductDetailArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.ProductDetail(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProfileNavigation.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileNavigation(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ProfileScreen(),
      );
    },
    RatingReviews.name: (routeData) {
      final args = routeData.argsAs<RatingReviewsArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.RatingReviews(
          key: args.key,
          product: args.product,
          list: args.list,
          numberReview: args.numberReview,
          rating: args.rating,
        ),
      );
    },
    Settings.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.Settings(),
      );
    },
    ShippingAddresses.name: (routeData) {
      final args = routeData.argsAs<ShippingAddressesArgs>(
          orElse: () => const ShippingAddressesArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.ShippingAddresses(key: args.key),
      );
    },
    ShopNavigation.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ShopNavigation(),
      );
    },
    ShopRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.ShopScreen(),
      );
    },
    ShopSearch.name: (routeData) {
      final args = routeData.argsAs<ShopSearchArgs>(
          orElse: () => const ShopSearchArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.ShopSearch(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.SignUpScreen(key: args.key),
      );
    },
    Splash.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.Splash(),
      );
    },
    SuccessRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SuccessScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddAddress]
class AddAddress extends _i28.PageRouteInfo<void> {
  const AddAddress({List<_i28.PageRouteInfo>? children})
      : super(
          AddAddress.name,
          initialChildren: children,
        );

  static const String name = 'AddAddress';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BagScreen]
class BagRoute extends _i28.PageRouteInfo<void> {
  const BagRoute({List<_i28.PageRouteInfo>? children})
      : super(
          BagRoute.name,
          initialChildren: children,
        );

  static const String name = 'BagRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Brand]
class Brand extends _i28.PageRouteInfo<BrandArgs> {
  Brand({
    _i29.Key? key,
    required List<String> brands,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          Brand.name,
          args: BrandArgs(
            key: key,
            brands: brands,
          ),
          initialChildren: children,
        );

  static const String name = 'Brand';

  static const _i28.PageInfo<BrandArgs> page = _i28.PageInfo<BrandArgs>(name);
}

class BrandArgs {
  const BrandArgs({
    this.key,
    required this.brands,
  });

  final _i29.Key? key;

  final List<String> brands;

  @override
  String toString() {
    return 'BrandArgs{key: $key, brands: $brands}';
  }
}

/// generated route for
/// [_i4.Chat]
class Chat extends _i28.PageRouteInfo<ChatArgs> {
  Chat({
    _i29.Key? key,
    required String currentUserId,
    required String friendUid,
    required String friendName,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          Chat.name,
          args: ChatArgs(
            key: key,
            currentUserId: currentUserId,
            friendUid: friendUid,
            friendName: friendName,
          ),
          initialChildren: children,
        );

  static const String name = 'Chat';

  static const _i28.PageInfo<ChatArgs> page = _i28.PageInfo<ChatArgs>(name);
}

class ChatArgs {
  const ChatArgs({
    this.key,
    required this.currentUserId,
    required this.friendUid,
    required this.friendName,
  });

  final _i29.Key? key;

  final String currentUserId;

  final String friendUid;

  final String friendName;

  @override
  String toString() {
    return 'ChatArgs{key: $key, currentUserId: $currentUserId, friendUid: $friendUid, friendName: $friendName}';
  }
}

/// generated route for
/// [_i5.CheckoutScreen]
class CheckoutRoute extends _i28.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i29.Key? key,
    required int totalPrice,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          CheckoutRoute.name,
          args: CheckoutRouteArgs(
            key: key,
            totalPrice: totalPrice,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i28.PageInfo<CheckoutRouteArgs> page =
      _i28.PageInfo<CheckoutRouteArgs>(name);
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({
    this.key,
    required this.totalPrice,
  });

  final _i29.Key? key;

  final int totalPrice;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, totalPrice: $totalPrice}';
  }
}

/// generated route for
/// [_i6.FavoritesScreen]
class FavoritesRoute extends _i28.PageRouteInfo<void> {
  const FavoritesRoute({List<_i28.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FiltersNavigation]
class FiltersNavigation extends _i28.PageRouteInfo<void> {
  const FiltersNavigation({List<_i28.PageRouteInfo>? children})
      : super(
          FiltersNavigation.name,
          initialChildren: children,
        );

  static const String name = 'FiltersNavigation';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i8.FiltersProduct]
class FiltersProduct extends _i28.PageRouteInfo<void> {
  const FiltersProduct({List<_i28.PageRouteInfo>? children})
      : super(
          FiltersProduct.name,
          initialChildren: children,
        );

  static const String name = 'FiltersProduct';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i28.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i28.PageInfo<ForgotPasswordRouteArgs> page =
      _i28.PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i28.PageRouteInfo<void> {
  const HomeRoute({List<_i28.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LoadingScreen]
class LoadingRoute extends _i28.PageRouteInfo<void> {
  const LoadingRoute({List<_i28.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LoginScreen]
class LoginRoute extends _i28.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i28.PageInfo<LoginRouteArgs> page =
      _i28.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.MainScreen]
class MainRoute extends _i28.PageRouteInfo<void> {
  const MainRoute({List<_i28.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i14.MyOrders]
class MyOrders extends _i28.PageRouteInfo<void> {
  const MyOrders({List<_i28.PageRouteInfo>? children})
      : super(
          MyOrders.name,
          initialChildren: children,
        );

  static const String name = 'MyOrders';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OrderDetail]
class OrderDetail extends _i28.PageRouteInfo<void> {
  const OrderDetail({List<_i28.PageRouteInfo>? children})
      : super(
          OrderDetail.name,
          initialChildren: children,
        );

  static const String name = 'OrderDetail';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaymentMethods]
class PaymentMethods extends _i28.PageRouteInfo<void> {
  const PaymentMethods({List<_i28.PageRouteInfo>? children})
      : super(
          PaymentMethods.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethods';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ProductCategory]
class ProductCategory extends _i28.PageRouteInfo<ProductCategoryArgs> {
  ProductCategory({
    _i30.Key? key,
    required String title,
    required List<_i31.Category> listCategory,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ProductCategory.name,
          args: ProductCategoryArgs(
            key: key,
            title: title,
            listCategory: listCategory,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductCategory';

  static const _i28.PageInfo<ProductCategoryArgs> page =
      _i28.PageInfo<ProductCategoryArgs>(name);
}

class ProductCategoryArgs {
  const ProductCategoryArgs({
    this.key,
    required this.title,
    required this.listCategory,
  });

  final _i30.Key? key;

  final String title;

  final List<_i31.Category> listCategory;

  @override
  String toString() {
    return 'ProductCategoryArgs{key: $key, title: $title, listCategory: $listCategory}';
  }
}

/// generated route for
/// [_i18.ProductDetail]
class ProductDetail extends _i28.PageRouteInfo<ProductDetailArgs> {
  ProductDetail({
    _i30.Key? key,
    required _i32.Product product,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ProductDetail.name,
          args: ProductDetailArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetail';

  static const _i28.PageInfo<ProductDetailArgs> page =
      _i28.PageInfo<ProductDetailArgs>(name);
}

class ProductDetailArgs {
  const ProductDetailArgs({
    this.key,
    required this.product,
  });

  final _i30.Key? key;

  final _i32.Product product;

  @override
  String toString() {
    return 'ProductDetailArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i7.ProfileNavigation]
class ProfileNavigation extends _i28.PageRouteInfo<void> {
  const ProfileNavigation({List<_i28.PageRouteInfo>? children})
      : super(
          ProfileNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigation';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ProfileScreen]
class ProfileRoute extends _i28.PageRouteInfo<void> {
  const ProfileRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RatingReviews]
class RatingReviews extends _i28.PageRouteInfo<RatingReviewsArgs> {
  RatingReviews({
    _i30.Key? key,
    required _i32.Product product,
    required List<_i33.ReviewProduct> list,
    required int numberReview,
    required double rating,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          RatingReviews.name,
          args: RatingReviewsArgs(
            key: key,
            product: product,
            list: list,
            numberReview: numberReview,
            rating: rating,
          ),
          initialChildren: children,
        );

  static const String name = 'RatingReviews';

  static const _i28.PageInfo<RatingReviewsArgs> page =
      _i28.PageInfo<RatingReviewsArgs>(name);
}

class RatingReviewsArgs {
  const RatingReviewsArgs({
    this.key,
    required this.product,
    required this.list,
    required this.numberReview,
    required this.rating,
  });

  final _i30.Key? key;

  final _i32.Product product;

  final List<_i33.ReviewProduct> list;

  final int numberReview;

  final double rating;

  @override
  String toString() {
    return 'RatingReviewsArgs{key: $key, product: $product, list: $list, numberReview: $numberReview, rating: $rating}';
  }
}

/// generated route for
/// [_i21.Settings]
class Settings extends _i28.PageRouteInfo<void> {
  const Settings({List<_i28.PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ShippingAddresses]
class ShippingAddresses extends _i28.PageRouteInfo<ShippingAddressesArgs> {
  ShippingAddresses({
    _i30.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ShippingAddresses.name,
          args: ShippingAddressesArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ShippingAddresses';

  static const _i28.PageInfo<ShippingAddressesArgs> page =
      _i28.PageInfo<ShippingAddressesArgs>(name);
}

class ShippingAddressesArgs {
  const ShippingAddressesArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'ShippingAddressesArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ShopNavigation]
class ShopNavigation extends _i28.PageRouteInfo<void> {
  const ShopNavigation({List<_i28.PageRouteInfo>? children})
      : super(
          ShopNavigation.name,
          initialChildren: children,
        );

  static const String name = 'ShopNavigation';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i23.ShopScreen]
class ShopRoute extends _i28.PageRouteInfo<void> {
  const ShopRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShopRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ShopSearch]
class ShopSearch extends _i28.PageRouteInfo<ShopSearchArgs> {
  ShopSearch({
    _i30.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          ShopSearch.name,
          args: ShopSearchArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ShopSearch';

  static const _i28.PageInfo<ShopSearchArgs> page =
      _i28.PageInfo<ShopSearchArgs>(name);
}

class ShopSearchArgs {
  const ShopSearchArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'ShopSearchArgs{key: $key}';
  }
}

/// generated route for
/// [_i25.SignUpScreen]
class SignUpRoute extends _i28.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i30.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i28.PageInfo<SignUpRouteArgs> page =
      _i28.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i30.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i26.Splash]
class Splash extends _i28.PageRouteInfo<void> {
  const Splash({List<_i28.PageRouteInfo>? children})
      : super(
          Splash.name,
          initialChildren: children,
        );

  static const String name = 'Splash';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SuccessScreen]
class SuccessRoute extends _i28.PageRouteInfo<void> {
  const SuccessRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}
