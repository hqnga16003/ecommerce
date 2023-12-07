import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/model/address.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../app/locator/locator.dart';
import '../add_address/address_bloc.dart';

@RoutePage()
class ShippingAddresses extends StatefulWidget {
  ShippingAddresses({super.key});

  @override
  State<ShippingAddresses> createState() => _ShippingAddressesState();
}

class _ShippingAddressesState extends State<ShippingAddresses> {
  final AddressBloc addressBloc = getIt<AddressBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        floatingActionButton: FloatingActionButton.small(
            backgroundColor: Colors.black,
            onPressed: () {
              AutoRouter.of(context).push(const AddAddress());
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        appBar: MyAppBar(
            title: "Shipping Addresses",
            icon: const Icon(Icons.search),
            onPressedSearch: () {}),
        body: BlocBuilder(
          bloc: addressBloc,
          builder: (context, state) {
            return Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: addressBloc.listAddressUser.length,
                        itemBuilder: (context, index) {
                          return _itemDetailAddress(
                              size, addressBloc.listAddressUser[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Gap(15),
                      ),
                    )
                  ],
                ));
          },
        ));
  }

  _itemDetailAddress(Size size, AddressUser addressUser) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          width: size.width,
          height: size.height * 0.2,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDefault(text: addressUser.name, color: Colors.black),
                  const TextDefault(text: "Edit", color: Color(0xffDB3022))
                ],
              ),
              const Gap(10),
              TextDefault(
                  text:
                      "${addressUser.address}\n${addressUser.state}, ${addressUser.zipCode}, ${addressUser.country}",
                  color: Colors.black),
              CheckBoxUseAddress(
                isChoose: addressUser.isChoose, onTap: (value ) {

              },
              )
            ],
          ),
        ),
      );
}

class CheckBoxUseAddress extends StatefulWidget {
  CheckBoxUseAddress({super.key, required this.isChoose, required this.onTap});

  bool isChoose;
  final Function(bool) onTap;

  @override
  State<CheckBoxUseAddress> createState() => _CheckBoxUseAddressState();
}

class _CheckBoxUseAddressState extends State<CheckBoxUseAddress> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: const EdgeInsets.all(0),
      controlAffinity: ListTileControlAffinity.leading,
      value: widget.isChoose,
      checkColor: Colors.white,
      activeColor: Colors.black,
      onChanged: (value) {
        setState(() {
          widget.isChoose = value!;
          widget.onTap(value);
        });
      },
      title: const TextDefault(
        text: "Use as the shipping address",
        color: Colors.black,
      ),
    );
  }
}
