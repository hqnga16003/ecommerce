import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RowNavigation extends StatelessWidget {
  const RowNavigation({super.key, required this.text, required this.onTap});
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          TextDefault(text: text,color: Colors.black),
          const Gap(2),
          const Icon(
            Icons.arrow_right_alt,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
