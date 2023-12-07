import 'package:auto_route/annotations.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/presentation/components/card_item_new.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/components/row_title.dart';
import 'package:ecommerce_app/presentation/components/tag.dart';
import 'package:ecommerce_app/presentation/screen/main/home/home_page_second/home_page_second.dart';
import 'package:ecommerce_app/presentation/screen/main/home/home_page_third/home_page_third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../app/locator/locator.dart';
import 'home_bloc/home_bloc.dart';
import 'home_bloc/home_event.dart';
import 'home_page_first/home_page_first.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = getIt<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(GetAllProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller,
          children:  [
            HomePageFirst(homeBloc: homeBloc),
            HomePageSecond(homeBloc: homeBloc,),
            HomePageThird(homeBloc: homeBloc,),
          ],
        ),
      ),
    );
  }
}
