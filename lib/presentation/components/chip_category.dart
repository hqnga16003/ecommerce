import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/FrameSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';

class ChipCategory extends StatelessWidget {
  const ChipCategory({super.key, required this.onTap, required this.title});
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: TextDefault(
            color: Colors.white,
            text: title,
          )),
    );
  }
}
