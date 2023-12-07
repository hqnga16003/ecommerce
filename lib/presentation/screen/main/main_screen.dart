import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:flutter/material.dart';

import '../../router/AppRouter.gr.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes:  const [
        HomeRoute(),
        ShopRoute(),
        BagRoute(),
        FavoritesRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(selectedItemColor: const Color(0xffDB3022),
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Shop"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: "Bag"),

              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
