import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItemNew extends StatelessWidget {
  const CardItemNew({super.key, required this.size, required this.product});

  final Size size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: MyCachedNetworkImage(
            url: product.imgProduct,
            width: size.width * 0.35,
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(10),
            child: Tag(color: Color(0xff222222), title: "NEW"))
      ],
    );
  }
}
