import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/model/list_order.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Delivered extends StatelessWidget {
  const Delivered({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return _ItemOrderDetail() ;
          },
          separatorBuilder: (BuildContext context, int index) => const Gap(15),
        ));
  }
}



class _ItemOrderDetail extends StatelessWidget {
  const _ItemOrderDetail({super.key, });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: size.width,
          height: size.height * 0.21,
          color: Colors.white,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextNameProduct(
                    text: "Order №1947034",
                  ),
                  TextDefault(
                      text: "05-12-2019", color: Color(0xff9B9B9B))
                ],
              ),
              const Gap(15),
              const Row(
                children: [
                  TextDefault(
                      text: "Tracking number",
                      color: Color(0xff9B9B9B)),
                  Gap(15),
                  TextDefault(text: "IW3475453455", color: Colors.black)
                ],
              ),
              const Gap(5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextDefault(
                          text: "Quantity", color: Color(0xff9B9B9B)),
                      Gap(15),
                      TextDefault(text: "3", color: Colors.black)
                    ],
                  ),
                  Row(
                    children: [
                      TextDefault(
                          text: "Total Amount:",
                          color: Color(0xff9B9B9B)),
                      Gap(15),
                      TextDefault(text: "112\$", color: Colors.black)
                    ],
                  ),
                ],
              ),
              const Gap(10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 1, color: Colors.black),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          AutoRouter.of(context).push(const OrderDetail());
                        },
                        child: const TextButtonDefault(
                            text: "Details", color: Colors.black)),
                  ),
                  const TextDefault(text: "Delivered", color: Color(0xff2AA952))
                ],
              )
            ],
          ),
        ));
  }
}
