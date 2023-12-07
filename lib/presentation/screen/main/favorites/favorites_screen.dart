import 'package:auto_route/annotations.dart';
import 'package:ecommerce_app/app/FrameSize.dart';
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';
import 'package:ecommerce_app/presentation/components/chip_category.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components/my_ratingbar.dart';
import '../../../components/my_text.dart';
import '../../../components/widget_filters.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBarIconSearch(title: "Favorites", onPressedSearch: () {}),
      body: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: WidgetFilters(),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(FrameSize.padding),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: size.height * 0.025),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(onTap: (){},
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.13,
                          child: const Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    child: MyCachedNetworkImage(
                                      url:
                                          "https://s3-alpha-sig.figma.com/img/1770/088f/bba96a73adb59b4213783033221c4b94?Expires=1702252800&Signature=j9vQ8a-xztVSFjy~UlqkRpDQ6IAdB2v75X8B5jcEcEdh1H67BqNOQzTsaoNApjzGTyYNbXwcwPAdUTMV2M6CxXGNAHcDkzgR04SgCY2WjKNZtbot8CWtyPdMXju8iAQoFYrcQvnAdeSd1FAe6QY2GohUYo8K0Y5xdxSEeyPmNLcrYNimEwyIeaYYsgSiFkuKb0-Jsatn9yA0PC7dibNNdDs~jsP1yf3xWGgXG8kqFML~CW9sysGx5Lya~Q-2OwtuMC3Ufn1uH4aXHB8GaquAaZPcuBvJdzkhRj7q47dTGILHCCf6JsPTz31cXIv49Uv0MPYunnYeXdid3GJdu0MNrA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                          TextSub(
                                              text: "LIME",
                                              color: AppColors.grayColor),
                                          Icon(Icons.clear)
                                        ],),
                                        TextNameProduct(text: "Shirt"),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                children: [
                                                  TextSub(
                                                      text: "Color:",
                                                      color: Color(0xff9B9B9B)),
                                                  Gap(5),
                                                  TextSub(
                                                      text: "Blue",
                                                      color: Colors.black)
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  TextSub(
                                                      text: "Size:",
                                                      color: Color(0xff9B9B9B)),
                                                  Gap(5),
                                                  TextSub(
                                                      text: "L",
                                                      color: Colors.black)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: TextNameProduct(
                                                    text: "32\$")),
                                            Expanded(
                                                flex: 2,
                                                child: MyRatingBar(
                                                    numberReviews: 15,
                                                    numberRating: 5))
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.red, // <-- Button color
                        foregroundColor: Colors.red, // <-- Splash color
                      ),
                      child: const Icon(Icons.shopping_bag, color: Colors.white),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Gap(15),
          ),
        ),
      ),
    );
  }
}
