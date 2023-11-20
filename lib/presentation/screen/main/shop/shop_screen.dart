import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_bloc.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/shop_kids/shop_kids.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/shop_men/shop_men.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/shop_women/shop_women.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/locator/locator.dart';

@RoutePage()
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ShopBloc shopBloc = getIt<ShopBloc>();

  @override
  void initState() {
    shopBloc.add(GetAllCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        title: "Categories",
        icon: const Icon(Icons.search),
        onPressedSearch: () {
          AutoRouter.of(context)
              .push(ShopSearch(listCategory: shopBloc.listCategories));
        },
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: const Color(0xffF9F9F9),
            elevation: 0,
            title: const TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Color(0xffDB3022)),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: "Women",
                ),
                Tab(
                  text: "Men",
                ),
                Tab(
                  text: "Kids",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ShopWomenTabBarView(),
              ShopMenTabBarView(),
              ShopKidsTabBarView(),
            ],
          ),
        ),
      ),
    );
  }
}
