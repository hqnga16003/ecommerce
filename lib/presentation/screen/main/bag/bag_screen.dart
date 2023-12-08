import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/model/address.dart';
import 'package:ecommerce_app/model/product_cart.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/add_address/address_bloc.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/cart_bloc.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/total_price_controller.dart';
import 'package:ecommerce_app/presentation/screen/main/favorites/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../app/locator/locator.dart';
import '../../../components/bottom_sheet_select_size.dart';
import '../../../components/my_cached_network_Img.dart';

@RoutePage()
class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  final CartBloc cartBloc = getIt<CartBloc>();
  final FavoritesBloc favoritesBloc = getIt<FavoritesBloc>();
  final AddressBloc addressBloc = getIt<AddressBloc>();

  TotalPriceController totalPriceController = Get.put(TotalPriceController());

  @override
  void initState() {
    super.initState();
    cartBloc.add(GetCart());
    addressBloc.add(GetAddressUser());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isChoose = false;

    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: MyAppBar(
        title: "Bag",
        icon: const Icon(Icons.search),
        onPressedSearch: () {},
      ),
      body: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: BlocConsumer(listener: (context, state) {

          },
            bloc: cartBloc,
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CartLoadedState) {
                totalPriceController.setValue(cartBloc.getTotalPrice().toInt());
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return _ItemCart(
                            onTapRemove: () {
                              cartBloc.add(RemoveProduct(state.list[index]));
                            },
                            onTapAddFavorites: () {
                              favoritesBloc.add(AddFavoriteEvent(
                                  state.list[index].product,
                                  state.list[index].size,
                                  state.list[index].color));
                            },
                            productCart: state.list[index],
                            onTapAdd: () {
                              state.list[index].quantity =
                                  state.list[index].quantity + 1;
                              totalPriceController.totalPrice.value =
                                  totalPriceController.totalPrice.value +
                                      state.list[index].product.priceProduct
                                          .toInt();
                              cartBloc.add(
                                  IncrementProductEvent(state.list[index]));
                            },
                            onTapDecrement: () {
                              state.list[index].quantity =
                                  state.list[index].quantity - 1;
                              totalPriceController.totalPrice.value =
                                  totalPriceController.totalPrice.value -
                                      state.list[index].product.priceProduct
                                          .toInt();
                              cartBloc.add(
                                  DecrementProductEvent(state.list[index]));
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Gap(15),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                          ),
                          builder: (context) {
                            return BottomSheetPromoCode(
                              onTapDiscount: (value, string) {
                                if (totalPriceController.isChoose.value ==
                                    true) {
                                  totalPriceController.totalPrice.value =
                                      cartBloc.getTotalPrice().round() -
                                          ((totalPriceController
                                                          .totalPrice.value *
                                                      value) /
                                                  100)
                                              .round();
                                } else {
                                  totalPriceController.totalPrice.value =
                                      totalPriceController.totalPrice.value -
                                          ((totalPriceController
                                                          .totalPrice.value *
                                                      value) /
                                                  100)
                                              .round();
                                  totalPriceController.isChoose.value = true;
                                }
                                totalPriceController.promoCode.value = string;
                                AutoRouter.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: size.width,
                            height: 35,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Obx(
                                      () => Text(
                                        "${totalPriceController.promoCode}",
                                        style: const TextStyle(
                                            color: Color(0xff9B9B9B),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    )),
                                Obx(
                                  () => totalPriceController.isChoose.value
                                      ? InkWell(
                                          onTap: () {
                                            totalPriceController.setValue(
                                                cartBloc
                                                    .getTotalPrice()
                                                    .round());
                                            totalPriceController
                                                .setPromoCodeDefault();
                                            totalPriceController
                                                .isChoose.value = false;
                                          },
                                          child: const Icon(Icons.clear))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                )
                              ],
                            ),
                          )),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total amount:",
                          style: TextStyle(
                              color: Color(0xff9B9B9B),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Obx(() => Text(
                              "${totalPriceController.totalPrice}\$",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            )),
                      ],
                    ),
                    const Gap(20),
                    ButtonDefault(
                        width: size.width,
                        height: 50,
                        text: "CHECK OUT",
                        onPressed: () {
                          AutoRouter.of(context).push(CheckoutRoute(
                              totalPrice:
                                  totalPriceController.totalPrice.value));
                        })
                  ],
                );
              }
              return const SizedBox();
            },
          )),
    );
  }
}

class _ItemCart extends StatelessWidget {
  const _ItemCart(
      {super.key,
      required this.productCart,
      required this.onTapAdd,
      required this.onTapDecrement,
      required this.onTapRemove,
      required this.onTapAddFavorites});

  final ProductCart productCart;
  final Function() onTapAdd;
  final Function() onTapDecrement;
  final Function() onTapRemove;
  final Function() onTapAddFavorites;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        width: size.width,
        height: size.height * 0.13,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: ClipRRect(
                  child: MyCachedNetworkImage(
                    url: productCart.product.imgProduct,
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
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productCart.product.categoryProduct,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                _ButtonIconShowMore(
                                  onTapAddTFavorites: onTapAddFavorites,
                                  onTapRemoveProduct: onTapRemove,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Color:",
                                      style: TextStyle(
                                          color: Color(0xff9B9B9B),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11),
                                    ),
                                    const Gap(5),
                                    Text(
                                      productCart.color,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    )
                                  ],
                                ),
                                const Gap(20),
                                Row(
                                  children: [
                                    const Text(
                                      "Size:",
                                      style: TextStyle(
                                          color: Color(0xff9B9B9B),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11),
                                    ),
                                    const Gap(5),
                                    Text(
                                      productCart.size,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: _DetailItemCart(
                          productCart: productCart,
                          onTapAdd: onTapAdd,
                          onTapDecrement: onTapDecrement,
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _ButtonIconShowMore extends StatefulWidget {
  const _ButtonIconShowMore(
      {super.key,
      required this.onTapAddTFavorites,
      required this.onTapRemoveProduct});

  final Function() onTapAddTFavorites;
  final Function() onTapRemoveProduct;

  @override
  State<_ButtonIconShowMore> createState() => _ButtonIconShowMoreState();
}

class _ButtonIconShowMoreState extends State<_ButtonIconShowMore> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: MenuAnchor(
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: const Icon(Icons.more_horiz),
            tooltip: 'Show menu',
          );
        },
        menuChildren: [
          MenuItemButton(
            onPressed: widget.onTapAddTFavorites,
            child: const Text(
              'Add to favorites',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          ),
          MenuItemButton(
            onPressed: widget.onTapRemoveProduct,
            child: const Text('Delete from the list',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}

class _DetailItemCart extends StatefulWidget {
  const _DetailItemCart({
    super.key,
    required this.productCart,
    required this.onTapAdd,
    required this.onTapDecrement,
  });

  final ProductCart productCart;
  final Function() onTapAdd;
  final Function() onTapDecrement;

  @override
  State<_DetailItemCart> createState() => _DetailItemCartState();
}

class _DetailItemCartState extends State<_DetailItemCart> {
  @override
  Widget build(BuildContext context) {
    bool isAdd = widget.productCart.quantity != 1 ? true : false;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                widget.onTapAdd();
                setState(() {});
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 35,
                  height: 35,
                  color: Colors.white,
                  child: const Icon(Icons.add, color: Color(0xff9B9B9B)),
                ),
              ),
            ),
            const Gap(10),
            Text(
              widget.productCart.quantity.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const Gap(10),
            InkWell(
              onTap: isAdd
                  ? () {
                      widget.onTapDecrement();
                      setState(() {});
                    }
                  : null,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 35,
                  height: 35,
                  color: Colors.white,
                  child: const Center(
                      child: Icon(
                    Icons.remove,
                    color: Color(0xff9B9B9B),
                  )),
                ),
              ),
            )
          ],
        ),
        Text(
          "${widget.productCart.product.priceProduct * widget.productCart.quantity}\$",
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}

class _IconPromoCode extends StatefulWidget {
  _IconPromoCode(
      {super.key, required this.isChoose, required this.onTapRemove});

  bool isChoose;
  final Function(bool) onTapRemove;

  @override
  State<_IconPromoCode> createState() => _IconPromoCodeState();
}

class _IconPromoCodeState extends State<_IconPromoCode> {
  @override
  Widget build(BuildContext context) {
    return widget.isChoose == true
        ? InkWell(
            onTap: () {
              setState(() {
                widget.onTapRemove(widget.isChoose);
                widget.isChoose = !widget.isChoose;
              });
            },
            child: const Icon(Icons.remove))
        : ClipRRect(
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
          );
  }
}
