import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/components/item_detail_product.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/my_ratingbar.dart';
import 'package:ecommerce_app/presentation/components/tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'my_text.dart';

class CardItemSale extends StatelessWidget {
  const CardItemSale({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: size.height * 0.1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: MyCachedNetworkImage(
              url: product.imgProduct,
              height: size.height * 0.25,
              width: size.width * 0.4,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Tag(
                color: const Color(0xffDB3022), title: "${product.discount}%")),
        Positioned(
          bottom: size.height * 0.075,
          right: 0,
          child: const FloatingActionButton.small(
            shape: CircleBorder(),

            backgroundColor: Colors.white,
            onPressed: null,
            child: Icon(
              Icons.favorite_border,
              color: Color(0xff9B9B9B),
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.01,
          left: 0,
          child: ItemDetailProduct(product: product),
        )
      ],
    );
  }
}
