import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../components/my_text.dart';

class Processing extends StatelessWidget {
  const Processing({super.key});


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: (context, index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: size.width,
                  height: size.height * 0.19,
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
                          SizedBox(width: 90,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1, color: Colors.black),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                onPressed: () {},
                                child: const TextButtonDefault(
                                    text: "Details", color: Colors.black)),
                          ),
                          const TextDefault(text: "Delivered", color: Color(0xff2AA952))
                        ],
                      )
                    ],
                  ),
                ));
          },
          separatorBuilder: (BuildContext context, int index) => const Gap(15),
        ));
  }
}
