import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../app/app_assets.dart';

class ShopMenTabBarView extends StatelessWidget {
  const ShopMenTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.050),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                height: size.height * 0.13,
                width: size.width,
                color: const Color(0xffDB3022),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SUMMER SALES",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Up to 50% off",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
          const Gap(10),
          _cardCategories(size, "NEW", AppAssets.imgNew),
          const Gap(10),
          _cardCategories(size, "Clothes", AppAssets.imgClothes),
          const Gap(10),
          _cardCategories(size, "Shoes", AppAssets.imgShoes),
          const Gap(10),
          _cardCategories(size, "Accesories", AppAssets.imgAccessories),
          const Gap(10),
        ],
      ),
    );
  }
  _textCategories(String title) => Text(
    title,
    style: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
  );
  _cardCategories(Size size, String title, String img) => ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
        height: size.height * 0.13,
        width: size.width,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.050),
                    child: _textCategories(title))),
            Expanded(
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                )),
          ],
        )),
  );
}
