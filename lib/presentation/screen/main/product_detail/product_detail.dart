import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/data/firebase_firestore_repository.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/my_ratingbar.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/cart_bloc.dart';
import 'package:ecommerce_app/presentation/screen/main/product_detail/bloc/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../app/locator/locator.dart';
import '../../../../model/product.dart';
import '../../../../model/review_product.dart';
import '../../../components/bottom_sheet_select_size.dart';

@RoutePage()
class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final ProductDetailBloc productDetailBloc = getIt<ProductDetailBloc>();
  final CartBloc cartBloc = getIt<CartBloc>();

  @override
  void initState() {
    super.initState();
    productDetailBloc.add(GetReviewsEvent(widget.product.idProduct));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    String sizeProduct = '';
    String colorProduct = '';

    return Scaffold(
      appBar: MyAppBar(
          title: widget.product.categoryProduct,
          icon: const Icon(Icons.share),
          onPressedSearch: () {}),
      body: BlocConsumer(
        listener: (context, state) {

        },
        bloc: productDetailBloc,
        builder: (context, state) {
          if (state is ProductDetailDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductDetailDataLoadedState) {

            return Column(
              children: [
                SizedBox(
                  height: size.height * 0.5,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MyCachedNetworkImage(
                            width: size.width * 0.75,
                            height: size.height * 0.55,
                            url: widget.product.imgProduct);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                      const Gap(5),
                      itemCount: 2),
                ),
                const Gap(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.050),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: DropdownMenu(
                                items: dropdownSizes,
                                hint: "Size",
                                onChange: (String newValue) {
                                  sizeProduct = newValue;
                                },
                              )),
                          const Gap(20),
                          Expanded(
                              child: DropdownMenu(
                                items: dropdownColors,
                                hint: "Color",
                                onChange: (String newValue) {
                                  colorProduct = newValue;
                                },
                              )),
                          const Gap(20),
                          const FloatingActionButton.small(
                            backgroundColor: Colors.white,
                            onPressed: null,
                            child: Icon(
                              Icons.favorite_border,
                              color: Color(0xff9B9B9B),
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      _detailProduct(context, widget.product, state.rating,
                          state.numberReviews, state.list)
                    ],
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
      bottomSheet: Padding(
          padding: EdgeInsets.all(size.width * 0.050),
          child: ButtonDefault(
              width: size.width,
              height: 50,
              text: "ADD TO CAR",
              onPressed: () {
                cartBloc.add(
                    AddToCartEvent(widget.product, sizeProduct, colorProduct));
              })),
    );
  }

  _detailProduct(BuildContext context, Product product, double rating,
      int numberReview, List<ReviewProduct> list) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.branchProduct,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Text(
                "\$${product.priceProduct}",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              )
            ],
          ),
          const Gap(5),
          const Text(
            "Short black dress",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xff9B9B9B)),
          ),
          const Gap(7),
          InkWell(
              onTap: () {
                AutoRouter.of(context).push(RatingReviews(
                    product: product,
                    numberReview: numberReview,
                    rating: rating,
                    list: list));
              },
              child: MyRatingBar(
                  numberReviews: product.numberReviews,
                  numberRating: product.numberRating)),
          const Gap(15),
          const Text(
            "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      );
}

class DropdownMenu extends StatefulWidget {
  DropdownMenu({
    super.key,
    required this.items,
    required this.hint,
    required this.onChange,
  });

  final List<DropdownMenuItem<String>> items;
  final String hint;
  final Function(String newValue) onChange;

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField(
          hint: Text(widget.hint),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 10),
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          iconSize: 14,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          onChanged: (String? newValue) {
            widget.onChange(newValue!);
          },
          items: widget.items),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownSizes {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "XS",
        child: Text(
          "XS",
        )),
    const DropdownMenuItem(
        value: "S",
        child: Text(
          "S",
        )),
    const DropdownMenuItem(
        value: "M",
        child: Text(
          "M",
        )),
    const DropdownMenuItem(
        value: "L",
        child: Text(
          "L",
        )),
    const DropdownMenuItem(
        value: "XL",
        child: Text(
          "Xl",
        )),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownColors {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "Black",
        child: Text(
          "Black",
        )),
    const DropdownMenuItem(
        value: "White",
        child: Text(
          "White",
        )),
    const DropdownMenuItem(
        value: "Red",
        child: Text(
          "Red",
        )),
    const DropdownMenuItem(
        value: "Brown",
        child: Text(
          "Brown",
        )),
    const DropdownMenuItem(
        value: "Yellow",
        child: Text(
          "Yellow",
        )),
    const DropdownMenuItem(
        value: "Blue",
        child: Text(
          "Blue",
        )),
  ];
  return menuItems;
}
