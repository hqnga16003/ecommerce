import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/home/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../components/card_item_new.dart';
import '../../../../components/my_button.dart';
import '../../../../components/my_cached_network_Img.dart';
import '../../../../components/row_title.dart';
import '../home_bloc/home_state.dart';

class HomePageFirst extends StatelessWidget {
  const HomePageFirst({super.key, required this.homeBloc});

  final HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: size.width,
              height: size.height * 0.65,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const MyCachedNetworkImage(
                      url:
                          "https://s3-alpha-sig.figma.com/img/79ae/0546/a5b3b3a0d1aee4267015f773bfb0a349?Expires=1701043200&Signature=R23jbP6oJUr5B1SrvCL6KmxyfbAwuYVgNQoJfjUixyiNEUnoiGBOcCpdg0dqdflpvmnoDBrdNGJl~AiWED4iFxiPzqeL2~cwVhv61mPMBotiz51LWgyLakt80OWOPcIG~L3-Z3HNYQZP5PdtkNEtUxj6eU1x3KcayWefZFo0wiTN1qi3VD5jJmXIJ3D24aI3GzHsarsCTZZckp2AxRu3xMjoST~U2UyHdo8FzmKeANFZtoOUE11ZahyEj1~8JGB9TMYAVJQawelVVKZctsMGSxqLOHqJuT~aGdwIKsvReXCVWloUyi0dkE9FbQHGoRpntc4l-aZOwMZMDCO8t9oekg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                  _textBackground(size),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.050, bottom: size.height * 0.025),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ButtonDefault(
                          width: size.width * 0.4,
                          text: "Check",
                          onPressed: () {}),
                    ),
                  ),
                ],
              )),
          const Gap(25),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.050, bottom: size.width * 0.050),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowTitle(
                  title: "New",
                  subTitle: "You’ve never seen it before!",
                  size: size,
                  onTabViewAll: () {},
                ),
                const Gap(20),
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
                            return CardItemNew(
                              size: size,
                              product: state.listProductsNew[index],
                              onTap: () {
                                AutoRouter.of(context).push(ProductDetail(
                                    product: state.listProductsNew[index]));
                              },
                            );
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
            left: size.width * 0.050, bottom: size.height * 0.1),
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Fashion\nsale",
            style: TextStyle(
                color: Colors.white, fontSize: 48, fontWeight: FontWeight.w900),
          ),
        ),
      );
}
