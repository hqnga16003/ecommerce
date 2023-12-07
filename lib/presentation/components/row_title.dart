import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'my_text.dart';

class RowTitle extends StatelessWidget {
  const RowTitle(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onTabViewAll,
      required this.size});

  final Size size;
  final String title;
  final String subTitle;
  final Function() onTabViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.050),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextTitle(text: title),
              InkWell(
                  onTap: onTabViewAll,
                  child: const TextSub(
                      text: "View all", color: Color(0xff222222))),
            ],
          ),
          TextSub(text: subTitle, color: const Color(0xff9B9B9B)),
        ],
      ),
    );
  }
}
