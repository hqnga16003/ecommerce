import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../app/locator/locator.dart';
import '../../../../../model/category.dart';
import '../../../../components/app_bar.dart';
import '../bloc/shop_bloc.dart';

@RoutePage()
class ShopSearch extends StatelessWidget {
  ShopSearch({super.key, required this.listCategory});

  final List<Category> listCategory;
  final ShopBloc shopBloc = getIt<ShopBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener(
      bloc: shopBloc,
      listener: (BuildContext context, state) async {
        if (state is GetProductLoadingState) {

        }
        if (state is GetProductLoadedState) {
          AutoRouter.of(context).push(ProductCategory(title: state.nameCategory));
        }
        if (state is GetProductErrorState) {
          await AutoRouter.of(context).pop();
          Future.delayed(Duration.zero, () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                            onPressed: () {
                              AutoRouter.of(context).pop();
                            },
                            child: const Text("Close"))
                      ],
                      title: const Text("Login Failure"),
                      content: Text(state.toString()),
                    ));
          });
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: MyAppBar(
          title: "",
          icon: const Icon(Icons.search),
          onPressedSearch: () {},
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.050),
              child: ButtonDefault(
                  height: 50,
                  width: size.width,
                  text: "VIEW ALL ITEMS",
                  onPressed: () {}),
            ),
            const Gap(15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.050),
              child: const TextDefault(
                  color: Color(0xff9B9B9B), text: "Choose category"),
            ),
            const Gap(30),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: listCategory.length,
                itemBuilder: (context, index) {
                  return _rowItemCategory(
                      listCategory[index].nameCategory, size, () {
                    shopBloc.add(GetProductsByCategory(
                        listCategory[index].nameCategory));
                  });
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Gap(20),
              ),
            )
          ],
        ),
      ),
    );
  }

  _rowItemCategory(String title, Size size, Function() onTap) => InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Gap(10),
            const Divider(color: Color(0xff9B9B9B))
          ],
        ),
      );
}
