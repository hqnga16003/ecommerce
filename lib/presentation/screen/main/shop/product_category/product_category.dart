import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/components/bottom_sheet_select_size.dart';
import 'package:ecommerce_app/presentation/components/item_detail_product.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../../app/locator/locator.dart';
import '../../../../../model/category.dart';
import '../../../../components/app_bar.dart';
import '../../../../components/item_choose.dart';
import '../../../../components/my_ratingbar.dart';
import '../../../../components/tag.dart';
import '../bloc/shop_bloc.dart';

@RoutePage()
class ProductCategory extends StatefulWidget {
  const ProductCategory({
    super.key,
    required this.title,
    required this.listCategory,
  });

  final String title;
  final List<Category> listCategory;

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  bool isGridView = false;
  final ShopBloc shopBloc = getIt<ShopBloc>();
  List<Product> list = [];

  @override
  void initState() {
    super.initState();
    shopBloc.add(GetProductsEvent(widget.title));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: MyAppBar(
          title: "Women’s ${widget.title}",
          icon: const Icon(Icons.search),
          onPressedSearch: () {},
        ),
        body: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(size.height * 0.03),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.050),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        itemCount: widget.listCategory.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _itemCategory(
                            widget.listCategory[index].nameCategory,
                            () {
                              shopBloc.add(GetProductsEvent(
                                  widget.listCategory[index].nameCategory));
                            },
                          );
                        },
                      ),
                    ),
                    const Gap(10),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.050),
                      child: Container(
                        color: const Color(0xffF9F9F9),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const FiltersNavigation());
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.filter_list),
                                  Gap(10),
                                  TextSub(text: "Filters", color: Colors.black),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  showDragHandle: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                  ),
                                  builder: (context) {
                                    return _bottomSheetSort(
                                      size,
                                      (nameSort) {
                                        shopBloc.add(
                                            SortListProductEvent(nameSort));
                                      },
                                    );
                                  },
                                );
                              },
                              child: BlocBuilder(
                                bloc: shopBloc,
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      const Icon(Icons.swap_vert_rounded),
                                      const Gap(10),
                                      TextSub(
                                          text: shopBloc.nameSort,
                                          color: Colors.black),
                                    ],
                                  );
                                },
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  isGridView = !isGridView;
                                  shopBloc.add(ChangeViewProductsEvent());
                                },
                                child: BlocBuilder(
                                  bloc: shopBloc,
                                  builder: (context, state) {
                                    return isGridView
                                        ? const Icon(Icons.list)
                                        : const Icon(Icons.view_module);
                                  },
                                ))
                          ],
                        ),
                      ),
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(size.width * 0.050),
            child: BlocBuilder(
              bloc: shopBloc,
              builder: (context, state) {
                Widget buildProductItem(List<Product> listProduct) {
                  return isGridView
                      ? GridView.builder(
                          itemCount: listProduct.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: size.height * 0.3,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return _ItemProductGridView(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  showDragHandle: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                  ),
                                  builder: (context) => _bottomSheetChooseSize(
                                      size, listProduct[index], shopBloc),
                                );
                              },
                              product: listProduct[index],
                            );
                          },
                        )
                      : ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: listProduct.length,
                          itemBuilder: (context, index) {
                            return _ItemProductListView(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  showDragHandle: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                  ),
                                  builder: (context) => BottomSheetSelectSize(
                                      size: size,
                                      onPressAddToCart: (value) {
                                        if (value.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: "Haven't chosen size yet");
                                        } else {
                                          AutoRouter.of(context).pop();
                                        }
                                      }),
                                );
                              },
                              product: listProduct[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Gap(15),
                        );
                }

                if (state is ProductsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductsLoadedState) {

                  return buildProductItem(state.listProduct);
                }
                if (state is ProductsErrorState) {
                  return Text(state.err);
                }

                return const SizedBox();
              },
            ),
          ),
        ));
  }

  _itemCategory(String title, Function() onTap) => InkWell(
        onTap: onTap,
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

  _itemBottomSheet(String title, Size size, Function() onTap) => SizedBox(
        width: size.width,
        child: TextButton(
            style: ButtonStyle(backgroundColor:
                MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color(0xffDB3022);
              }
              return Colors.transparent;
            })),
            onPressed: () {
              AutoRouter.of(context).pop();
              onTap();
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            )),
      );

  _bottomSheetSort(Size size, Function(String nameSort) onTap) => SizedBox(
        height: size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Sort by",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            _itemBottomSheet("Popular", size, () => {onTap("Popular")}),
            _itemBottomSheet("Newest", size, () => {onTap("Newest")}),
            _itemBottomSheet(
                "Customer review", size, () => {onTap("Customer review")}),
            _itemBottomSheet("Price: lowest to high", size,
                () => {onTap("Price: lowest to high")}),
            _itemBottomSheet("word-wrap: break-word", size,
                () => {onTap("word-wrap: break-word")}),
          ],
        ),
      );
}

class _ItemProductListView extends StatelessWidget {
  const _ItemProductListView({required this.onTap, required this.product});

  final Product product;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(bottom: size.height * 0.025),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              width: size.width,
              height: size.height * 0.13,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        child: MyCachedNetworkImage(
                          url: product.imgProduct,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.categoryProduct,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const Gap(5),
                            Text(
                              product.branchProduct,
                              style: const TextStyle(
                                  color: Color(0xff9B9B9B),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11),
                            ),
                            const Gap(5),
                            MyRatingBar(
                              numberReviews: product.numberReviews,
                              numberRating: product.numberRating,
                            ),
                            const Gap(5),
                            Text(
                              "${product.priceProduct}\$",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 10,
          child: FloatingActionButton.small(
            shape: CircleBorder(),
            heroTag: null,
            backgroundColor: Colors.white,
            onPressed: null,
            child: Icon(
              Icons.favorite_border,
              color: Color(0xff9B9B9B),
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemProductGridView extends StatelessWidget {
  const _ItemProductGridView({required this.onTap, required this.product});

  final Product product;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(bottom: size.height * 0.1),
            child: SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: MyCachedNetworkImage(
                  url: product.imgProduct,
                  height: size.height * 0.25,
                  width: size.width * 0.4,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: size.height * 0.075,
          right: 0,
          child: const FloatingActionButton.small(
            shape: CircleBorder(),

            heroTag: null,
            backgroundColor: Colors.white,
            onPressed: null,
            child: Icon(
              Icons.favorite_border,
              color: Color(0xff9B9B9B),
            ),
          ),
        ),
        product.discount != 0
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: Tag(
                    color: const Color(0xffDB3022),
                    title: "-${product.discount}%"))
            : const SizedBox(),
        Positioned(
          bottom: size.height * 0,
          left: 0,
          child: ItemDetailProduct(product: product),
        )
      ],
    );
  }
}

_bottomSheetChooseSize(Size size, Product product, ShopBloc shopBloc) =>
    Container(
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
                onTap: (value) {},
              ),
              ItemChoose(
                title: "S",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {},
              ),
              ItemChoose(
                title: "M",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {},
              ),
              ItemChoose(
                title: "L",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {},
              ),
              ItemChoose(
                title: "XL",
                width: size.width * 0.25,
                height: 50,
                onTap: (value) {},
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
                //shopBloc.add(AddToCartEvent(product));
                //shopBloc.add(AddToCartEvent(product));
                //shopBloc.addToCart(product, "S");
              },
            ),
          ),
        ],
      ),
    );
