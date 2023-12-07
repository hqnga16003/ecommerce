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
          const Gap(15),
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
                const Gap(10),
                BlocBuilder<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  builder: (BuildContext context, HomeState state) {
                    if (state is AllProductsLoadedState) {
                      state.listProductsSale[0].imgProduct =
                          "https://s3-alpha-sig.figma.com/img/c8d6/cd3c/953d61faf9fd666897e97a67e9857028?Expires=1702857600&Signature=KL~nwBOhE91YwZIY4vXilZ4sys1CnPT~ty02pBsZTy-OXgmkFlNIg0mfUKycL1~vX6gCZj53t7Vk~d9FUqHu1SICkFZgga6D0cnBRNb7NaV6setgzqtH6eB9Z2N2C-qbLicH6bqIiw2jgIrvpmBHl9eqj9lkudPOHPCPm4Yzwqignx3XtTAz6ezvEMYT-~NaOwzcttFbeVphqzNNBl-8CV11gqmh6CjX2qha709I7h~xCxVR8t~9jUeFiMF-~~ZK~1esK40-IPoNThU3-WomVzdiEhW-qOdLODSXXpMgcGBm~ib-xhBLsL-a-hLrBaOXxCZlmMjdYI-i4tAnEV-hNw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
                      state.listProductsSale[0].branchProduct = "Dorothy Perkins";
                      state.listProductsSale[0].categoryProduct = "Evening Dress";
                      state.listProductsSale[0].priceProduct = 15;
                      state.listProductsSale[0].discount = 20;
                      state.listProductsNew[1].imgProduct = "https://s3-alpha-sig.figma.com/img/744c/af4f/8cbe22e0d501d66b730b03c24f793383?Expires=1702857600&Signature=NOtRLh4aYIadLETZ7vMwOMIHFrIGQC~cZc6nqnhOfHyKHkyjGZ4YIEtPKLkByhBEKAxPzdVs~QMWbWHCZdvFVbXxZZ-he0ZX9bddcZl-g~BSrOQ3Z5wkawW-2mJjHxwl8jBkYE6bKMRaWEAFSuP1iTnGDajBQ9wlZZrCMw9YE9X6gFwelRXP01u4N~er0cPZga-hAmdc8Gq6qIcMkVssG1SN3EgOOP55vmHUhzRmSWk3prtI4nnz7rhIv4kl6gNgyqJSvFk7XqlvBU99esvEX07Xn0Yb2Bf2ynZEdFCznQAblsfi2OjaraucSKpU-fja7e4w6JH55dEzr7EcoymnZg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";

                      return SizedBox(
                        height: size.height * 0.35,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.listProductsSale.length,
                          itemBuilder: (context, index) {
                            return CardItemSale(
                              product: state.listProductsSale[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Gap(20),
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                RowTitle(
                  title: "New",
                  subTitle: "You’ve never seen it before!",
                  size: size,
                  onTabViewAll: () {},
                ),
                const Gap(10),
                BlocBuilder<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  builder: (BuildContext context, HomeState state) {
                    if (state is AllProductsLoadedState) {
                      return SizedBox(
                        height: size.height * 0.35,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.listProductsNew.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                child: CardItemNew(
                              size: size,
                              product: state.listProductsNew[index],
                              onTap: () {},
                            ));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Gap(20),
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                )
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
