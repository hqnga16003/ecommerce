import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../app/app_colors.dart';
import 'chip_category.dart';
import 'my_text.dart';

class WidgetFilters extends StatelessWidget {
  const WidgetFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ChipCategory(onTap: () {}, title: "Summer");
            },
          ),
        ),
        const Gap(20),
         const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.filter_list,
                  color: AppColors.blackColor,
                ),
                Gap(10),
                TextSub(text: "Filters", color: AppColors.blackColor),
              ],
            ),
            Row(
              children: [
                Icon(Icons.swap_vert_rounded),
                Gap(10),
                TextSub(text: "Price: lowest to high", color: Colors.black),
              ],
            ),
            Icon(Icons.view_module),
          ],
        )
      ],
    );
  }
}
