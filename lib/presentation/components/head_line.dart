import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({super.key, required this.titleHeadLine});

  final String titleHeadLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios)),
        const Gap(30),
        Text(
          titleHeadLine,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 34,
          ),
        )
      ],
    );
  }
}
