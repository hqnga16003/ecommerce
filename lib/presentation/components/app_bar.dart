import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'chip_category.dart';
import 'my_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, required this.icon, required this.onPressedSearch});

  final String title;
  final Icon icon;
  final Function() onPressedSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff222222)),
      ),
      leading: IconButton(
        onPressed: () {
          AutoRouter.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onPressedSearch,
          icon: icon,
          color: Colors.black,
        ),
      ],


    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class MyAppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarDefault({super.key, required this.title, required this.onPressedSearch});

  final String title;
  final Function() onPressedSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff222222)),
      ),
      leading: IconButton(
        onPressed: () {
          AutoRouter.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),


    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class MyAppBarIconSearch extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarIconSearch({super.key, required this.title, required this.onPressedSearch});

  final String title;
  final Function() onPressedSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff222222)),
      ),
      leading: IconButton(
        onPressed: () {
          AutoRouter.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onPressedSearch,
          icon: const Icon(Icons.search),
          color: Colors.black,
        ),
      ],


    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
