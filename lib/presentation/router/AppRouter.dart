import 'package:async_button_builder/async_button_builder.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/loading/loading.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/success/success.dart';

import 'AppRouter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Splash.page),

    AutoRoute(page: LoadingRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page,),
    AutoRoute(page: ForgotPasswordRoute.page,),
    AutoRoute(page: MainRoute.page,initial: true,children: [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: ShopNavigation.page,initial: true,children: [
        AutoRoute(page: ShopRoute.page,initial: true),
        AutoRoute(page: ShopSearch.page),
        AutoRoute(page: ProductCategory.page),


      ]),
      AutoRoute(page: BagRoute.page,),
      AutoRoute(page: FavoritesRoute.page),
      AutoRoute(page: ProfileNavigation.page,children: [
        AutoRoute(page: ProfileRoute.page,initial: true),
        AutoRoute(page: MyOrders.page),
        AutoRoute(page: OrderDetail.page,),
        AutoRoute(page: Settings.page),
        AutoRoute(page: Chat.page),

      ]),

    ] ),

    AutoRoute(page: FiltersNavigation.page,children: [
      AutoRoute(page: FiltersProduct.page,initial: true),
      AutoRoute(page: Brand.page)
    ]),
    AutoRoute(page: ProductDetail.page),
    AutoRoute(page: RatingReviews.page),
    AutoRoute(page: CheckoutRoute.page),
    AutoRoute(page: SuccessRoute.page,),
    AutoRoute(page: PaymentMethods.page),
    AutoRoute(page: ShippingAddresses.page),
    AutoRoute(page: AddAddress.page,),

  ];
}