import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/presentation/components/card_item_sale.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/components/row_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import '../../../../components/card_item_new.dart';
import '../../../../components/my_cached_network_Img.dart';
import '../../../../components/tag.dart';
import '../home_bloc/home_bloc.dart';
import '../home_bloc/home_state.dart';

class HomePageSecond extends StatelessWidget {
  const HomePageSecond({super.key, required this.homeBloc});

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.25,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const MyCachedNetworkImage(
                  url:
                      "https://s3-alpha-sig.figma.com/img/ff9f/e689/5f92a300e886114d2dde23fbe28ad1be?Expires=1701043200&Signature=ItnBp6nHL9mjcfpnrHWngQv3QMl0US3NQf7~T6IYtxSmF7xEg9oiPfmca4Bk6cik-rmszyPvL7P7YfOXIs73dFRqxEhWpFiKsaKdOjOsvesJPEOtSBGIph4RMFtY~77OqLtbU~s07~iMIy5N1sWW4FuX~aG9vq~atqHMy-wcNPaqpRNJFCEYPtHNMnrhUZCJnA~AGmwvrFgq0aurXkt7ElMS-KeerTs-4bwGH1wJyQlyLjFBfG9QqaNX6vLD4tuiw0umzq8bXBk4mvNNFJDhItHp1RBFEO36LvtPqADwnY1aeNMU3qCBe5Hp9quFWZat65Gl18wmxzKkn3Zw6kxf2g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                ),
                _textBackground(size)
              ],
            ),
          ),
          const Gap(25),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.050, bottom: size.width * 0.050),
            child: Column(
              children: [
                RowTitle(
                    title: "SALE",
                    subTitle: "Super summer sale",
                    size: size,
                    onTabViewAll: () {}),
                const Gap(20),
                BlocBuilder<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  builder: (BuildContext context, HomeState state) {
                    if (state is AllProductsLoadedState) {
                      return SizedBox(
                        height: size.height * 0.35,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.listProductsSale.length,
                          itemBuilder: (context, index) {
                            return CardItemSale(
                                product: state.listProductsSale[index],);
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Gap(20),
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                const Gap(30),
                RowTitle(
                  title: "New",
                  subTitle: "You’ve never seen it before!",
                  size: size,
                  onTabViewAll: () {},
                ),
                const Gap(20),
                // SizedBox(
                //   height: size.height * 0.20,
                //   child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 3,
                //     itemBuilder: (context, index) {
                //       return CardItemNew(size: size,);
                //     },
                //     separatorBuilder: (BuildContext context, int index) =>
                //     const Gap(20),
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }

  _textBackground(Size size) => Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.050, bottom: size.height * 0.025),
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Street clothes",
            style: TextStyle(
                color: Colors.white, fontSize: 34, fontWeight: FontWeight.w900),
          ),
        ),
      );
}
