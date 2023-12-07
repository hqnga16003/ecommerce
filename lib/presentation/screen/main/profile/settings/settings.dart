import 'package:auto_route/annotations.dart';
import 'package:ecommerce_app/presentation/components/bottom_sheet_select_size.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/components/text_field.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/cancelled.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/delivered.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/processing.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../components/app_bar.dart';

@RoutePage()
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: MyAppBar(
            title: "", icon: const Icon(Icons.search), onPressedSearch: () {}),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TextSize34(title: "Settings"),
              const Gap(20),
              const TextNameProduct(text: "Personal Information"),
              const Gap(10),
              const TextFieldInputCart(hintText: "Full name"),
              const Gap(10),
              const TextFieldInputCart(hintText: "Date of Birth"),
              const Gap(30),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextNameProduct(text: "Password"),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                          ),
                          builder: (context) => const BottomSheetChangePassword(),
                        );
                      },
                      child:
                          const TextDefault(text: "Change", color: Color(0xff9B9B9B)))
                ],
              ),
              const Gap(10),
              const TextFieldInputCart(hintText: "Password"),
              const Gap(30),
              const TextNameProduct(text: "Notifications"),
              const Gap(10),
              _itemNotification("Sales", true, () => () {}),
              const Gap(15),
              _itemNotification("New arrivals", false, () => () {}),
              const Gap(15),
              _itemNotification("Delivery status changes", false, () => () {}),
            ]),
          ),
        ));
  }

  _itemNotification(String title, bool isChoose, Function() onTap) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextDefault(text: title, color: Colors.black),
          _MySwitchButton(
            isChoose: isChoose,
            onTap: () {},
          )
        ],
      );
}

class _MySwitchButton extends StatefulWidget {
  _MySwitchButton({super.key, required this.onTap, required this.isChoose});

  bool isChoose;
  final Function() onTap;

  @override
  State<_MySwitchButton> createState() => _MySwitchButtonState();
}

class _MySwitchButtonState extends State<_MySwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.isChoose,
      activeColor: const Color(0xff2AA952),
      onChanged: (bool value) {
        setState(() {
          widget.onTap();
          widget.isChoose = value;
        });
      },
    );
  }
}
