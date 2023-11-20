import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRatingBar extends StatelessWidget {
  const MyRatingBar({super.key, required this.numberReviews, required this.numberRating});
  final int numberReviews;
  final int numberRating;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        RatingBar.builder(
          itemSize: 14,
          ignoreGestures: true,
          initialRating: numberRating.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2),
          itemBuilder: (context, _) =>
          const Icon(
            Icons.star,
            color: Color(0xffFFBA49),
          ),
          onRatingUpdate: (rating) {},
        ),
        Text(
          "($numberReviews)",
          style: const TextStyle(
              color: Color(0xff9B9B9B),
              fontSize: 10,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
