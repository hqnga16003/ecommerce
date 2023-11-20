import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_cached_network_Img.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../app/locator/locator.dart';
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
  });

  final String title;

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  bool isGridView = false;
  final ShopBloc shopBloc = getIt<ShopBloc>();
  List<Product> list = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: MyAppBar(
          title: "",
          icon: const Icon(Icons.search),
          onPressedSearch: () {},
        ),
        body: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Women’s ${widget.title}",
              style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff222222)),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(size.height * 0.09),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.050),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        itemCount: shopBloc.listCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _itemCategory(
                            shopBloc.listCategories[index].nameCategory,
                            () {},
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
                                    .push( const FiltersNavigation());
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
                                        shopBloc
                                            .add(SortListProductView(nameSort));
                                      },
                                    );
                                  },
                                );
                              },
                              child: BlocBuilder(
                                bloc: shopBloc,
                                builder: (context, state) {
                                  if (state is ProductSortListViewState) {
                                    return Row(
                                      children: [
                                        const Icon(Icons.swap_vert_rounded),
                                        const Gap(10),
                                        TextSub(
                                            text: state.nameSort,
                                            color: Colors.black),
                                      ],
                                    );
                                  }
                                  return const Row(
                                    children: [
                                      Icon(Icons.swap_vert_rounded),
                                      Gap(10),
                                      TextSub(
                                          text: "Price: lowest to high",
                                          color: Colors.black),
                                    ],
                                  );
                                },
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  isGridView = !isGridView;
                                  shopBloc
                                      .add(ChangeListViewProducts(isGridView));
                                },
                                child: BlocBuilder(
                                  bloc: shopBloc,
                                  builder: (context, state) {
                                    if (state is GridViewState) {
                                      return const Icon(Icons.list);
                                    }
                                    return const Icon(Icons.view_module);
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
                Widget buildProductItem(Widget Function() bottomSheetBuilder) {
                  return isGridView
                      ? GridView.builder(
                          itemCount: shopBloc.listProduct.length,
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
                                  builder: (context) => bottomSheetBuilder(),
                                );
                              },
                              product: shopBloc.listProduct[index],
                            );
                          },
                        )
                      : ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: shopBloc.listProduct.length,
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
                                  builder: (context) => bottomSheetBuilder(),
                                );
                              },
                              product: shopBloc.listProduct[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Gap(15),
                        );
                }
                Widget buildProductItem1(List<Product> list,Widget Function() bottomSheetBuilder) {
                  return isGridView
                      ? GridView.builder(
                    itemCount: list.length,
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
                            builder: (context) => bottomSheetBuilder(),
                          );
                        },
                        product: list[index],
                      );
                    },
                  )
                      : ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
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
                            builder: (context) => bottomSheetBuilder(),
                          );
                        },
                        product: list[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Gap(15),
                  );
                }


                if (state is GridViewState ||
                    state is ProductSortListViewState && isGridView) {
                  return buildProductItem(() => _bottomSheetChooseSize(size));
                }

                if (state is ListViewState ||
                    state is ProductSortListViewState && !isGridView) {
                  return buildProductItem(() => _bottomSheetChooseSize(size));
                }
                if (state is FilteredProductsState){
                  return buildProductItem1(state.list, () => _bottomSheetChooseSize(size));
                }

                return buildProductItem(() => _bottomSheetChooseSize(size));
              },
            ),
          ),
        ));
  }

  _itemCategory(String title, Function() onTap) => Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: TextDefault(
        color: Colors.white,
        text: title,
      ));

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
    return SizedBox(
      height: size.height * 0.15,
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: size.width,
                height: size.height * 0.13,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: MyCachedNetworkImage(
                          url: product.imgProduct,
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
            child: FloatingActionButton.small(heroTag: null,
              backgroundColor: Colors.white,
              onPressed: null,
              child: Icon(
                Icons.favorite_border,
                color: Color(0xff9B9B9B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemProductGridView extends StatelessWidget {
  const _ItemProductGridView(
      {required this.onTap, required this.product});

  final Product product;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: size.height * 0.2,
              width: size.width,
              child: MyCachedNetworkImage(url: product.imgProduct),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomRight,
          heightFactor: 4.2,
          child: FloatingActionButton.small(
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
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 14,
          child: MyRatingBar(
              numberReviews: product.numberReviews,
              numberRating: product.numberRating),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 16.5,
          child: TextSub(
              text: product.branchProduct, color: const Color(0xff9B9B9B)),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 12.5,
          child: Text(
            product.categoryProduct,
            style: const TextStyle(
                color: Color(0xff222222),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 16,
          child: Row(
            children: [
              product.discount != 0
                  ? Text(
                      "${product.priceProduct}\$",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9B9B9B)),
                    )
                  : Text(
                      "${product.priceProduct}\$",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
              const Gap(5),
              product.discount != 0
                  ? Text(
                      "${product.priceProduct - (product.priceProduct * product.discount / 100).round()}\$",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffDB3022)),
                    )
                  : const Text("")
            ],
          ),
        )
      ],
    );
  }
}

_bottomSheetChooseSize(Size size) => Container(
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
              ItemChoose(title: "XS", width: size.width * 0.25, height: 50),
              ItemChoose(title: "S", width: size.width * 0.25, height: 50),
              ItemChoose(title: "M", width: size.width * 0.25, height: 50),
              ItemChoose(title: "L", width: size.width * 0.25, height: 50),
              ItemChoose(title: "XL", width: size.width * 0.25, height: 50)
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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
