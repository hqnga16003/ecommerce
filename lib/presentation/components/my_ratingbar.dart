import 'package:ecommerce_app/model/review_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class MyRatingBar extends StatelessWidget {
  const MyRatingBar(
      {super.key, required this.numberReviews, required this.numberRating});

  final int numberReviews;
  final int numberRating;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          itemBuilder: (context, _) => const Icon(
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

class RatingBarReview extends StatelessWidget {
  const RatingBarReview(
      {super.key,
      required this.totalQuantityRating,
      required this.size,
      required this.list,
      required this.initialRating});

  final List<ReviewProduct> list;
  final double initialRating;
  final int totalQuantityRating;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.rotate(
              angle: 3.15,
              child: RatingBar.builder(
                unratedColor: Colors.transparent,
                itemSize: 14,
                ignoreGestures: true,
                initialRating: initialRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color(0xffFFBA49),
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
            const Gap(5),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Colors.red,
                width: (((list.length / totalQuantityRating * 100) / 100) *
                        (size.width * 0.3))
                    .roundToDouble(),
                height: 10,
              ),
            )
          ],
        ),
        Text(
          "(${list.length})",
          style: const TextStyle(
              color: Color(0xff9B9B9B),
              fontSize: 10,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
