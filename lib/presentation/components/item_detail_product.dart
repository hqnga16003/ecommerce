import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'my_ratingbar.dart';
import 'my_text.dart';

class ItemDetailProduct extends StatelessWidget {
  const ItemDetailProduct({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyRatingBar(
          numberReviews: product.numberReviews,
          numberRating: product.numberRating,
        ),
        const Gap(3),
        TextSub(
            text: product.branchProduct, color: const Color(0xff9B9B9B)),
        const Gap(3),
        Text(
          product.categoryProduct,
          style: const TextStyle(
              color: Color(0xff222222),
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        const Gap(3),
        Row(
          children: [
            product.discount != 0
                ? Text(
              "${product.priceProduct}\$",
              style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9B9B9B)),
            )
                : Text(
              "${product.priceProduct}\$",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Gap(5),
            product.discount != 0
                ? Text(
              "${product.priceProduct - (product.priceProduct * product.discount / 100).round()}\$",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffDB3022)),
            )
                : const Text("")
          ],
        ),
      ],
    );
  }
}
