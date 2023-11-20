import 'package:auto_route/auto_route.dart';

import 'AppRouter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Splash.page),

    AutoRoute(page: Loading.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page,),
    AutoRoute(page: MainRoute.page,initial: true,children: [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: ShopNavigation.page,initial: true,children: [
        AutoRoute(page: ShopRoute.page,initial: true),
        AutoRoute(page: ShopSearch.page,),
        AutoRoute(page: ProductCategory.page),


      ]),
      AutoRoute(page: BagRoute.page),
      AutoRoute(page: FavoritesRoute.page),
      AutoRoute(page: ProfileRoute.page),

    ] ),

    AutoRoute(page: FiltersNavigation.page,children: [
      AutoRoute(page: FiltersProduct.page,initial: true),
      AutoRoute(page: Branch.page)
    ]),

  ];
}