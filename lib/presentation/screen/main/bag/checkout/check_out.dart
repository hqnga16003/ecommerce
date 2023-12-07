import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/model/address.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/cart_bloc.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/checkout/payment_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pay/pay.dart';

import '../../../../../app/locator/locator.dart';
import '../add_address/address_bloc.dart';

@RoutePage()
class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({super.key, required this.totalPrice});

  final int totalPrice;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final AddressBloc addressBloc = getIt<AddressBloc>();

  final CartBloc cartBloc = getIt<CartBloc>();

  final CheckoutBloc checkoutBloc = getIt<CheckoutBloc>();

  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
    paymentItems: const [
      PaymentItem(
        label: 'Total',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      )
    ],
    type: GooglePayButtonType.pay,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener(
      bloc: checkoutBloc,
      listener: (context, state) {
        AutoRouter.of(context).push(const SuccessRoute());
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffF9F9F9),
            appBar: MyAppBar(
                title: "Checkout",
                icon: const Icon(Icons.search),
                onPressedSearch: () {}),
            body: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextNameProduct(text: "Shipping address"),
                  const Gap(10),
                  BlocBuilder(
                    bloc: addressBloc,
                    builder: (context, state) {
                      return _buildAddress(
                          size,
                          addressBloc.getAddressUserDefault(),
                          () => {
                                AutoRouter.of(context).push(ShippingAddresses())
                              });
                    },
                  ),
                  const Gap(30),
                  _buildPayment(() =>
                      {AutoRouter.of(context).push(const PaymentMethods())}),
                  const Gap(30),
                  const TextNameProduct(text: "Delivery method"),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: _buildItemDelivery(AppAssets.imgFedex)),
                      const Gap(15),
                      Expanded(child: _buildItemDelivery(AppAssets.imgUsps)),
                      const Gap(15),
                      Expanded(child: _buildItemDelivery(AppAssets.imgDhl)),
                    ],
                  ),
                  const Gap(30),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextDefault(
                              text: "Order", color: Color(0xff9B9B9B)),
                          TextNameProduct(text: "${widget.totalPrice}\$")
                        ],
                      ),
                      const Gap(10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextDefault(
                              text: "Delivery", color: Color(0xff9B9B9B)),
                          TextNameProduct(text: "15\$")
                        ],
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextDefault(
                              text: "Summary", color: Color(0xff9B9B9B)),
                          TextNameProduct(text: "${widget.totalPrice + 15}\$")
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: ButtonDefault(
                    width: size.width,
                    height: 50,
                    text: "SUBMIT ORDER",
                    onPressed: () {
                      checkoutBloc.add(SubmitOrderEvent(
                          widget.totalPrice,
                          cartBloc.listProductCart,
                          addressBloc.getAddressUserDefault()));
                    }))),
      ),
    );
  }

  _buildAddress(Size size, AddressUser addressUser, Function() onTap) =>
      ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            width: size.width,
            height: size.height * 0.13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextDefault(text: addressUser.name, color: Colors.black),
                    InkWell(
                        onTap: onTap,
                        child: const TextDefault(
                            text: "Change", color: Color(0xffDB3022)))
                  ],
                ),
                const Gap(10),
                TextDefault(
                    text:
                        "${addressUser.address}\n${addressUser.state}, ${addressUser.zipCode}, ${addressUser.country}",
                    color: Colors.black),
              ],
            ),
          ));

  _buildItemDelivery(String img) => ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        color: Colors.white,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(img),
            const Gap(10),
            const TextSub(text: "2-3 days", color: Color(0xff9B9B9B))
          ],
        ),
      ));

  _buildPayment(Function() onTap) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextNameProduct(text: "Payment"),
              InkWell(
                onTap: onTap,
                child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child:
                        TextDefault(text: "Change", color: Color(0xffDB3022))),
              )
            ],
          ),
          const Gap(10),
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 60,
                    height: 40,
                    color: Colors.white,
                    child: Image.asset(
                      AppAssets.imgMasterCart,
                    ),
                  )),
              const Gap(15),
              const TextDefault(
                  text: "**** **** **** 3947", color: Colors.black)
            ],
          )
        ],
      );
}
