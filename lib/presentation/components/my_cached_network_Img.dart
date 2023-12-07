import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  const MyCachedNetworkImage(
      {super.key, required this.url, this.width, this.height});

  final String url;
  final double? width;
  final double? height;


  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(

      width: width,
      height: height,
      fit: BoxFit.fill,
      imageUrl: url,
      placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      const Center(child: Icon(Icons.error)),
    );
  }
}
