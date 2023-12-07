import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components/app_bar.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: MyAppBar(
            title: "", icon: const Icon(Icons.search), onPressedSearch: () {}),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: const TextSize34(
                  title: "My profile",
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: const SizedBox(
                        width: 70,
                        height: 70,
                        child: MyCachedNetworkImage(
                            url:
                                "https://s3-alpha-sig.figma.com/img/581b/273d/1a360f84cfd9a99708fc889ab7d86e6c?Expires=1702252800&Signature=MCbFZa5xUuMzsbUmehw-byDSUWsa8ubXLQ1gdt846~yo~hI8Qo5C3JPtC5NiwJWWKF~hDNIhPYiL64PH0u8gYhnulZ~QTc5K-SO3z0r~vltsLLTADMXH3IvWu5t~3OTSe8GpvyoCIWhQiQlxlglbqu-KovFQtCnHgCopXmiKGZ9PZ7~Tjru~Of8eT7Vp9F~qObqvfYop5vyniAn1qXi4U4H0bFASIUIm5VJaK-i3OQLSYv6qw1x~j2c77u9hhnJ47Cmb0ji41d4IBmk2fxvvbug8Bfc9Pg4MRcEFsjVWSi1nABtuU3GWi18AyFXZEOx1-mdEqDPWT02V08AEGaVKpg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextAppBar(text: "Matilda Brown"),
                          TextDefault(
                              text: "matildabrown@mail.com",
                              color: Color(0xff9B9B9B))
                        ],
                      ),
                    )
                  ],
                )),
            const Gap(20),
            _buildItem(size, "My orders", "Already have 12 orders",
                () => {AutoRouter.of(context).push(const MyOrders())}),
            const Divider(),
            _buildItem(size, "Shipping addresses", "3 ddresses", () => {}),
            const Divider(),
            _buildItem(size, "Payment methods", "Visa **34", () => {}),
            const Divider(),
            _buildItem(
                size, "Promocodes", "You have special promocodes", () => {}),
            const Divider(),
            _buildItem(size, "My reviews", "Reviews for 4 items", () => {}),
            const Divider(),
            _buildItem(
                size,
                "Chat1",
                "Chat",
                () => {
                      AutoRouter.of(context).push(Chat(
                          currentUserId: "z0hU0E2CQwN27kCFvISJXkxKm5r1",
                          friendUid: "ZHEh7BP2oDdmY94UMzrh3LuJuM73", friendName: 'Admin'))
                    }),
            const Divider(),
            _buildItem(
                size,
                "Chat2",
                "Chat",
                () => {
                      AutoRouter.of(context).push(Chat(
                          currentUserId: "ZHEh7BP2oDdmY94UMzrh3LuJuM73",
                          friendUid: "z0hU0E2CQwN27kCFvISJXkxKm5r1", friendName: 'User'))
                    }),
            const Divider(),
            _buildItem(size, "Settings", "Notifications, password", () => {
              AutoRouter.of(context).push(const Settings())
            }),
            const Divider(),
          ]),
        ));
  }

  _buildItem(Size size, String title, String subTitle, Function() onTap) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
        child: InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNameProduct(text: title),
                  const Gap(5),
                  TextSub(text: subTitle, color: const Color(0xff9B9B9B)),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      );
}
