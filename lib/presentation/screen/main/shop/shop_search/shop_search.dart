import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../app/locator/locator.dart';
import '../../../../components/app_bar.dart';
import '../bloc/shop_bloc.dart';
import 'bloc/shop_search_bloc.dart';

@RoutePage()
class ShopSearch extends StatefulWidget {
  ShopSearch({super.key});

  @override
  State<ShopSearch> createState() => _ShopSearchState();
}

class _ShopSearchState extends State<ShopSearch> {
  final ShopSearchBloc shopSearchBloc = getIt<ShopSearchBloc>();

  @override
  void initState() {
    shopSearchBloc.add(GetAllCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: MyAppBar(
        title: "Categories",
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
          BlocBuilder(
            bloc: shopSearchBloc,
            builder: (context, state) {
              if (state is GetAllCategoriesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetAllCategoriesLoadedState) {
                if (state.listCategories.isNotEmpty) {


                  return Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: state.listCategories.length,
                      itemBuilder: (context, index) {
                        return _rowItemCategory(
                            state.listCategories[index].nameCategory, size, () {
                          AutoRouter.of(context).push(ProductCategory(
                              title: state.listCategories[index].nameCategory,listCategory: state.listCategories));
                        });
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Gap(20),
                    ),
                  );
                } else {
                  return const Center(child: Text("No Categories"));
                }
              }
              if (state is GetAllCategoriesErrorState) {
                return Center(child: Text(state.err));
              }

              return const Text("data");
            },
          )
        ],
      ),
    );
  }

  _rowItemCategory(String title, Size size, Function() onTap) => InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const Divider(color: Color(0xff9B9B9B))
          ],
        ),
      );
}
