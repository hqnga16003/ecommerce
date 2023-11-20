import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'my_text.dart';



class InformationProduct extends StatelessWidget {
  const InformationProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
     // MyRatingBar(numberReviews: 10),
      TextSub(text: "manufacturer", color: Color(0xff9B9B9B)),
      Text(
        "nameProduct",
        style: TextStyle(
            color: Color(0xff222222),
            fontWeight: FontWeight.w400,
            fontSize: 16),
      ),
      Row(
        children: [
          Text(
            "price\$",
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff9B9B9B)),
          ),
          Gap(5),
          Text(
            "sdfsdfsdfds\$",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xffDB3022)),
          )
        ],
      )
    ],);
  }
}
