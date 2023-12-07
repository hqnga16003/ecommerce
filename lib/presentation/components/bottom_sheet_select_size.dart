import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/review_product.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import '../../app/FrameSize.dart';
import '../../app/app_colors.dart';
import '../screen/main/rating_reviews/bloc/rating_review_bloc.dart';
import 'item_choose.dart';
import 'my_button.dart';
import 'my_text.dart';

class BottomSheetSelectSize extends StatelessWidget {
  final Size size;
  final Function(List<String>) onPressAddToCart;
  List<String> sizesProduct = [];

  BottomSheetSelectSize(
      {super.key, required this.size, required this.onPressAddToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.35,
      width: size.width,
      color: const Color(0xffF9F9F9),
      child: Column(
        children: [
          const Center(
            child: TextBottomSheet(text: "Select size"),
          ),
          const Gap(20),
          Wrap(
            runAlignment: WrapAlignment.start,
            runSpacing: 10,
            spacing: 10.0,
            children: <Widget>[
              ItemChoose(
                title: "XS",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {
                  onTapItem("XS", value);
                },
              ),
              ItemChoose(
                title: "S",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {
                  onTapItem("S", value);
                },
              ),
              ItemChoose(
                title: "M",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {
                  onTapItem("M", value);
                },
              ),
              ItemChoose(
                title: "L",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {
                  onTapItem("L", value);
                },
              ),
              ItemChoose(
                title: "XL",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {
                  onTapItem("XL", value);
                },
              )
            ],
          ),
          const Gap(10),
          const Divider(
            thickness: 1,
            color: Color(0xff9B9B9B),
          ),
          const Gap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Size info",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          const Gap(10),
          const Divider(
            thickness: 1,
            color: Color(0xff9B9B9B),
          ),
          const Gap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: ButtonDefault(
              height: 50,
              width: size.width,
              text: "ADD TO CART",
              onPressed: () {
                onPressAddToCart(sizesProduct);
              },
            ),
          ),
        ],
      ),
    );
  }

  void onTapItem(String size, bool value) {
    if (value) {
      sizesProduct.add(size);
    } else {
      sizesProduct.remove(size);
    }
  }
}

class BottomSheetReview extends StatefulWidget {
  const BottomSheetReview({super.key, required this.onTap});

  final Function(String content, int rating) onTap;

  @override
  State<BottomSheetReview> createState() => _BottomSheetReviewState();
}

class _BottomSheetReviewState extends State<BottomSheetReview> {
  int rating = 0;

  final reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.6,
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: ButtonDefault(
              width: size.width,
              height: 50,
              text: "SEND REVIEW",
              onPressed: () {
                widget.onTap(reviewController.text, rating);
              }),
          body: Column(
            children: [
              const Text(
                "What is you rate",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  this.rating = rating.toInt();
                },
              ),
              const Gap(10),
              const Text(
                "Please share your opinion\nabout the product",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              TextField(
                controller: reviewController,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    filled: true,

                    hintText: 'Your review',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,),fillColor: Colors.white),
              ),
              const Gap(20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: Colors.white,
                    height: 100,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                              height: 50,
                              width: 50,
                              color: const Color(0xffDB3022),
                              child: const Icon(
                                Icons.photo_camera,
                                color: Colors.white,
                              )),
                        ),
                        const Gap(10),
                        const Text(
                          "Add your photos",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetPromoCode extends StatefulWidget {
  const BottomSheetPromoCode({super.key, required this.onTapDiscount});

  final Function(int,String) onTapDiscount;

  @override
  State<BottomSheetPromoCode> createState() => _BottomSheetPromoCodeState();
}

class _BottomSheetPromoCodeState extends State<BottomSheetPromoCode> {
  int rating = 0;

  final reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color(0xffF9F9F9),
      child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: size.width,
                    height: 35,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Enter your promo code",
                            style: TextStyle(
                                color: Color(0xff9B9B9B),
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.black,
                            width: 35,
                            height: 35,
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const Gap(20),
              const Text(
                "Your Promo Codes",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const Gap(10),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: size.width,
                          height: size.height * 0.1,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    color: Colors.black,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "10",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 34,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Gap(5),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "%",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "off",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                              const Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Personal offer",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Gap(5),
                                        Text(
                                          "mypromocode2020",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "6 days remaining",
                                        style: TextStyle(
                                            color: Color(0xff9B9B9B),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Gap(5),
                                      ButtonDefault(
                                          width: 85,
                                          text: "Apply",
                                          onPressed: () {
                                            widget.onTapDiscount(10,"mypromocode2020");
                                          })
                                    ],
                                  )),
                            ],
                          ),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Gap(15),
                ),
              )
            ],
          )),
    );
  }
}

class BottomSheetInputCard extends StatelessWidget {
  const BottomSheetInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.55,
      color: const Color(0xffF9F9F9),
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.width * 0.05),
        child: Column(
          children: [
            const TextAppBar(text: "Add new card"),
            const Gap(15),
            const TextFieldInputCart(
              hintText: "Name on card",
            ),
            const Gap(10),
            const TextFieldInputCart(
              hintText: "Card number",
            ),
            const Gap(10),
            const TextFieldInputCart(
              hintText: "Expire Date",
            ),
            const Gap(10),
            const TextFieldInputCart(
              hintText: "CVV",
            ),
            const Gap(10),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: true,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value) {},
              title: const TextDefault(
                text: "Set as default payment method",
                color: Colors.black,
              ),
            ),
            const Gap(10),
            ButtonDefault(
                width: size.width,
                height: 50,
                text: "ADD CARD",
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class BottomSheetChangePassword extends StatelessWidget {
  const BottomSheetChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: FrameSize.padding,
          right: FrameSize.padding,
          bottom: FrameSize.padding),
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        bottomNavigationBar: ButtonDefault(
            width: FrameSize.screenWidth,
            height: FrameSize.heightButton,
            text: "SAVE PASSWORD",
            onPressed: () {}),
        body: Column(
          children: [
            const TextBottomSheet(text: "Password Change"),
            const Gap(20),
            const TextFieldInputCart(hintText: "Old Password"),
            const Gap(20),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {},
                    child: const TextDefault(
                        text: "Forgot Password?", color: Colors.grey))),
            const Gap(20),
            const TextFieldInputCart(hintText: "New Password"),
            const Gap(20),
            const TextFieldInputCart(hintText: "Repeat New Password"),
          ],
        ),
      ),
    );
  }
}

