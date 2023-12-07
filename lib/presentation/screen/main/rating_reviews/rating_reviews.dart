import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/review_product.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';

import 'package:ecommerce_app/presentation/components/my_ratingbar.dart';
import 'package:ecommerce_app/presentation/screen/main/rating_reviews/bloc/rating_review_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../app/locator/locator.dart';
import '../../../components/bottom_sheet_select_size.dart';
import '../product_detail/bloc/product_detail_bloc.dart';

@RoutePage()
class RatingReviews extends StatefulWidget {
  const RatingReviews(
      {super.key,
      required this.product,
      required this.list,
      required this.numberReview,
      required this.rating});

  final Product product;
  final List<ReviewProduct> list;
  final int numberReview;
  final double rating;

  @override
  State<RatingReviews> createState() => _RatingReviewsState();
}

class _RatingReviewsState extends State<RatingReviews> {
  final RatingReviewBloc ratingReviewBloc = getIt<RatingReviewBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xffDB3022),
          onPressed: () {
            showModalBottomSheet(backgroundColor: Colors.white,
              isScrollControlled: true,
              context: context,
              showDragHandle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              builder: (context) => BottomSheetReview(
                onTap: (content, rating) {
                  ReviewProduct reviewProduct = ReviewProduct(
                      "z0hU0E2CQwN27kCFvISJXkxKm5r1",
                      widget.product.idProduct,
                      content,
                      rating,
                      DateTime.now(),
                      ["1", "2", "3"]);
                  ratingReviewBloc.add(AddReviewEvent(reviewProduct,widget.product.numberRating));
                  AutoRouter.of(context).pop();
                },
              ),
            );
          },
          label: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Icon(Icons.edit),
              ),
              Text("Write a review")
            ],
          )),
      appBar: MyAppBar(
          title: "", icon: const Icon(Icons.share), onPressedSearch: () {}),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: BlocBuilder(
          bloc: ratingReviewBloc,
          builder: (context, state) {
            Widget buildRatingReview(List<ReviewProduct> list,double rating,int numberReviews) {
              List<ReviewProduct> listComment = [];
              for (var element in list) {
                if (element.content.isNotEmpty) {
                  listComment.add(element);
                }
              }
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rating&Reviews",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff222222)),
                  ),
                  const Gap(20),
                  RatingView(
                      listReviews: list,
                      rating: rating,
                      numberReviews: numberReviews),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${listComment.length} reviews",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff222222)),
                      ),
                      Row(
                        children: [
                          _CheckBoxShowPhoto(onTap: (value) {}, isChoose: true),
                          const Text(
                            "With photo",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  const Gap(20),
                  Flexible(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return _detailComment(context, listComment[index]);
                        },
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: listComment.length),
                  )
                ],
              );
            }
            if(state is RatingReviewReloadState){
              return  buildRatingReview(state.list, state.rating, state.numberReviews);

            }
              return  buildRatingReview(widget.list, widget.rating, widget.numberReview);
          }
        ),
      ),
    );
  }

  _detailComment(BuildContext context, ReviewProduct reviewProduct) => Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 28, top: 28),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Helene Moore",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          unratedColor: Colors.transparent,
                          itemSize: 14,
                          ignoreGestures: true,
                          initialRating: reviewProduct.rating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xffFFBA49),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Text(
                          DateFormat.yMMMMd().format(reviewProduct.createAt),
                          style: const TextStyle(
                              color: Color(0xff9B9B9B),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Gap(15),
                    Text(
                      reviewProduct.content,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const Gap(15),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Helpful",
                          style: TextStyle(
                              color: Color(0xff9B9B9B),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                        Gap(10),
                        Icon(
                          Icons.thumb_up,
                          color: Color(0xff9B9B9B),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                "https://s3-alpha-sig.figma.com/img/ad00/491c/cc0d067e35dd9b263899dcc9d9612853?Expires=1702857600&Signature=SYP8K41-h-4wkSxozAJNAmMBjJCivMuSoT5vt-YE0y10lilRcNrdyVnWooU190dKAlleze2zCfk0orCmF9uCsvvnP2MT95QbyIB0c2gYzrO06CLtBSSNQfEECwViwY7xz7~OrSE2CAZ53c0Ec4Yd1AzuPm4Xtts3jlI-7WHsGqtXTTx6i9kaAUTGL0u3NDvDkmxP-fAYQXFbKgACAL7G-vA9FDRoURCunnkKFwhvmztyn~uZKUV3fuW7UWhg0IXMiWBPZ9JEAfl0qnt-Jo9grw7-4Dgp5HhLwRhZupk3Eycr-AvJUWnJD8fd4Cx2RtV58gETeBTK0N975kGNRHEB7w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      );
}

class _CheckBoxShowPhoto extends StatefulWidget {
  _CheckBoxShowPhoto({super.key, required this.onTap, required this.isChoose});

  final Function(bool) onTap;
  bool isChoose;

  @override
  State<_CheckBoxShowPhoto> createState() => _CheckBoxShowPhotoState();
}

class _CheckBoxShowPhotoState extends State<_CheckBoxShowPhoto> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: const Color(0xffDB3022),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      checkColor: Colors.white,
      value: widget.isChoose,
      onChanged: (bool? value) {
        setState(() {
          widget.isChoose = value!;
          widget.onTap(value);
        });
      },
    );
  }
}

class RatingView extends StatelessWidget {
  const RatingView({
    super.key,
    required this.listReviews,
    required this.numberReviews,
    required this.rating,
  });

  final List<ReviewProduct> listReviews;
  final int numberReviews;
  final double rating;

  @override
  Widget build(BuildContext context) {
    List<ReviewProduct> listReviews5s =
        listReviews.where((element) => element.rating == 5).toList();
    List<ReviewProduct> listReviews4s =
        listReviews.where((element) => element.rating == 4).toList();
    List<ReviewProduct> listReviews3s =
        listReviews.where((element) => element.rating == 3).toList();
    List<ReviewProduct> listReviews2s =
        listReviews.where((element) => element.rating == 2).toList();
    List<ReviewProduct> listReviews1s =
        listReviews.where((element) => element.rating == 1).toList();

    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                rating.toStringAsFixed(2),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 44),
              ),
              const Gap(10),
              Text(
                "$numberReviews ratings",
                style: const TextStyle(
                    color: Color(0xff9B9B9B),
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              RatingBarReview(
                list: listReviews5s,
                totalQuantityRating: numberReviews == 0 ? 1 : numberReviews,
                size: size,
                initialRating: 5,
              ),
              const Gap(10),
              RatingBarReview(
                list: listReviews4s,
                totalQuantityRating: numberReviews == 0 ? 1 : numberReviews,
                size: size,
                initialRating: 4,
              ),
              const Gap(10),
              RatingBarReview(
                list: listReviews3s,
                totalQuantityRating: numberReviews == 0 ? 1 : numberReviews,
                size: size,
                initialRating: 3,
              ),
              const Gap(10),
              RatingBarReview(
                list: listReviews2s,
                totalQuantityRating: numberReviews == 0 ? 1 : numberReviews,
                size: size,
                initialRating: 2,
              ),
              const Gap(10),
              RatingBarReview(
                list: listReviews1s,
                totalQuantityRating: numberReviews == 0 ? 1 : numberReviews,
                size: size,
                initialRating: 1,
              ),
              const Gap(10),
            ],
          ),
        )
      ],
    );
  }
}
