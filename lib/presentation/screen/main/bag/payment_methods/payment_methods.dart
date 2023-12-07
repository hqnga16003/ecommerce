import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../components/bottom_sheet_select_size.dart';

@RoutePage()
class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: const Color(0xffF9F9F9),
        floatingActionButton: FloatingActionButton.small(
            backgroundColor: Colors.black,
            onPressed: () {
              showModalBottomSheet(isScrollControlled: true,
                context: context,
                showDragHandle: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10)),
                ),
                builder: (context) => const BottomSheetInputCard(),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        appBar: MyAppBar(
            title: "Payment methods",
            icon: const Icon(Icons.search),
            onPressedSearch: () {

            }),
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextNameProduct(text: "Your payment cards"),
            const Gap(10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: size.width,
                height: size.height * 0.25,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppAssets.imgChip),
                      const Gap(30),
                      const Text(
                        " * * * *  * * * *  * * * *  3947",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400),
                      ),
                      Gap(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Holder Name",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Gap(5),
                                TextDefault(
                                    text: "Jennyfer Doe", color: Colors.white)
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expiry Date",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Gap(5),
                                TextDefault(text: "05/23", color: Colors.white)
                              ],
                            ),
                          ),
                          Image.asset(AppAssets.imgMasterCart)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Gap(10),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: true,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value) {},
              title: const TextDefault(
                text: "Use as default payment method",
                color: Colors.black,
              ),
            ),
            const Gap(10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: size.width,
                height: size.height * 0.25,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(AppAssets.imgVisa)),
                      const Gap(25),
                      const Text(
                        " * * * *  * * * *  * * * *  4546",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400),
                      ),
                      const Gap(10),
                      Image.asset(AppAssets.imgChip),
                      const Gap(30),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card Holder Name",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              Gap(5),
                              TextDefault(
                                  text: "Jennyfer Doe", color: Colors.white)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expiry Date",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              Gap(5),
                              TextDefault(text: "11/22", color: Colors.white)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: false,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value) {},
              title: const TextDefault(
                text: "Use as default payment method",
                color: Colors.black,
              ),
            )
          ]),
        ));
  }
}
