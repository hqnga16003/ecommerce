import 'package:auto_route/annotations.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/cancelled.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/delivered.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/processing.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../components/app_bar.dart';

@RoutePage()
class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: MyAppBar(
            title: "Order Details",
            icon: const Icon(Icons.search),
            onPressedSearch: () {}),
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextNameProduct(text: "Order №1947034"),
                TextDefault(text: "05-12-2019", color: Color(0xff9B9B9B))
              ],
            ),
            const Gap(10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextDefault(
                        text: "Tracking number:", color: Color(0xff9B9B9B)),
                    Gap(5),
                    TextDefault(text: "IW3475453455", color: Colors.black),
                  ],
                ),
                TextDefault(text: "Delivered", color: Color(0xff2AA952))
              ],
            ),
            const Gap(20),
            const TextDefault(text: "3 items", color: Colors.black),
            const Gap(20),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const _ItemOrderDetail();
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Gap(15),
              ),
            ),
            const Gap(20),
            const TextDefault(text: "Order information", color: Colors.black),
            const Gap(20),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: TextDefault(
                      text: "Shipping Address:", color: Color(0xff9B9B9B)),
                ),
                Gap(5),
                Expanded(
                  flex: 2,
                  child: Wrap(
                    children: [
                      TextDefault(
                          text:
                              "3 Newbridge Court ,Chino Hills,CA 91709, United States",
                          color: Colors.black)
                    ],
                  ),
                ),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: TextDefault(
                      text: "Payment method:", color: Color(0xff9B9B9B)),
                ),
                const Gap(10),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Image.asset(AppAssets.imgMasterCart),
                      const Gap(10),
                      const TextDefault(
                          text: "**** **** **** 3947", color: Colors.black),
                    ],
                  ),
                )
              ],
            ),
            const Gap(20),
            const Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextDefault(
                        text: "Delivery method:", color: Color(0xff9B9B9B))),
                Gap(5),
                Expanded(
                    flex: 2,
                    child: TextDefault(
                        text: "FedEx, 3 days, 15\$", color: Colors.black)),
              ],
            ),
            const Gap(20),
            const Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextDefault(
                        text: "Discount:", color: Color(0xff9B9B9B))),
                Gap(5),
                Expanded(
                  flex: 2,
                  child: TextDefault(
                      text: "10%, Personal promo code", color: Colors.black),
                ),
              ],
            ),
            const Gap(20),
            const Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextDefault(
                        text: "Total Amount:", color: Color(0xff9B9B9B))),
                Gap(5),
                Expanded(
                    flex: 2,
                    child: TextDefault(text: "133\$", color: Colors.black)),
              ],
            ),
                const Gap(20),

                Row(
              children: [
                Expanded(child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.black),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    child: const TextButtonDefault(
                        text: "Reorder", color: Colors.black))),
                Gap(20),
                Expanded(child: ButtonDefault(width: size.width, text: "Leave feedback", onPressed: (){}))
              ],
            )
          ]),
        ));
  }
}

class _ItemOrderDetail extends StatelessWidget {
  const _ItemOrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: size.width,
          height: size.height * 0.15,
          child: const Row(
            children: [
              Expanded(
                  flex: 1,
                  child: MyCachedNetworkImage(
                    url:
                        "https://s3-alpha-sig.figma.com/img/1821/5f62/e259b4c9081785e2fb7f4b553d1a8023?Expires=1702252800&Signature=AqJeySHGaMi4XF15bsxtV9NzZDMDMMnA9d5VHpDGVS-xYnCYYPhLOqDbEAbAoy10HnNMEnlPDXFPauuYEKr5~uRvyIsaTl5qPPUgc7mOWofl3eL1OFZGNB6SLxMNpaMANM6FPInDhsZgVFNKdeK-8QeZEu7LlAPfKaxKohnHmfCCd319P7Sc3EEAC5WsGFcYFzg1k4R~gT7bRvbbMi9F0Q6yqdKLzPIuc7WpqLnad9w8N42JbylnBLri3rbn5Aj1EH7QWkrhxD5bMhblRqPrzfluWDrrDcEyTspy3prF1g4UaWwii5vFcK6HLU8sV8kTpN267eYuNtrzZcij5w8hSg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextNameProduct(text: "Pullover"),
                        Gap(5),
                        TextSub(text: "Mango", color: Color(0xff9B9B9B)),
                        Gap(5),
                        Row(
                          children: [
                            Row(
                              children: [
                                TextSub(
                                    text: "Color:", color: Color(0xff9B9B9B)),
                                Gap(5),
                                TextSub(text: "Gray", color: Colors.black)
                              ],
                            ),
                            Gap(20),
                            Row(
                              children: [
                                TextSub(
                                    text: "Size:", color: Color(0xff9B9B9B)),
                                Gap(5),
                                TextSub(text: "L", color: Colors.black)
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                TextSub(
                                    text: "Units:", color: Color(0xff9B9B9B)),
                                Gap(5),
                                TextSub(text: "1", color: Colors.black)
                              ],
                            ),
                            TextDefault(text: "51\$", color: Colors.black)
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
