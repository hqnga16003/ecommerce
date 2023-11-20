import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/product_discount.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/my_ratingbar.dart';
import 'package:ecommerce_app/presentation/components/tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'my_text.dart';

class CardItemSale extends StatelessWidget {
  const CardItemSale(
      {super.key, required this.product});


  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.35,
      width: size.width * 0.4,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: MyCachedNetworkImage(
              url: product.imgProduct,
              height: size.height * 0.25,
              width: size.width * 0.4,
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            heightFactor: 5,
            child: FloatingActionButton.small(
              backgroundColor: Colors.white,
              onPressed: null,
              child: Icon(
                Icons.favorite_border,
                color: Color(0xff9B9B9B),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Tag(
                  color: const Color(0xffDB3022),
                  title: "-${product.discount}%")),
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 18,
            child: MyRatingBar(
              numberReviews: product.numberReviews,
              numberRating: product.numberRating,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 21,
            child: TextSub(text: product.branchProduct, color: const Color(0xff9B9B9B)),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 15.5,
            child: Text(
              product.categoryProduct,
              style: const TextStyle(
                  color: Color(0xff222222),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 20,
            child: Row(
              children: [
                Text(
                  "${product.priceProduct}\$",
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff9B9B9B)),
                ),
                const Gap(5),
                Text(
                  "${product.priceProduct - (product.priceProduct * product.discount / 100).round()}\$",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffDB3022)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
