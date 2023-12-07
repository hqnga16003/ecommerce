import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'item_detail_product.dart';
import 'my_ratingbar.dart';
import 'my_text.dart';

class CardItemNew extends StatelessWidget {
  const CardItemNew({super.key, required this.size, required this.product, required this.onTap});

  final Size size;
  final Product product;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Stack(
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
          const Padding(
              padding: EdgeInsets.all(10),
              child: Tag(color: Color(0xff222222), title: "NEW")),
          Positioned(
            bottom: size.height * 0.075,
            right: 0,
            child: const FloatingActionButton.small(heroTag: null,
              backgroundColor: Colors.white,
              shape:  CircleBorder(),
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
      ),
    );
  }
}



