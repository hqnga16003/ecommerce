import 'package:auto_route/annotations.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/cancelled.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/delivered.dart';
import 'package:ecommerce_app/presentation/screen/main/profile/my_orders/processing.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../components/app_bar.dart';

@RoutePage()
class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final PageController controller = PageController(initialPage: 0);
    int index = 0;

    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: MyAppBar(
            title: "", icon: const Icon(Icons.search), onPressedSearch: () {}),
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextSize34(title: "My Orders"),
            const Gap(10),
            _ItemSelect(onTap: (int value) {
              if(index != value){
                controller.jumpToPage(value);
                index = value;
              }
            },),
            const Gap(10),
            Expanded(
              child: PageView(
                controller: controller,
                children: const [Delivered(), Processing(), Cancelled()],
              ),
            )
          ]),
        ));
  }
}

class _ItemSelect extends StatefulWidget {
  _ItemSelect({super.key, required this.onTap});
  final Function(int index) onTap;
  @override
  State<_ItemSelect> createState() => _ItemSelectState();
}

class _ItemSelectState extends State<_ItemSelect> {
  bool pageOne = true;
  bool pageTwo = false;
  bool pageThree = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.onTap(0);
              pageOne = true;
              pageTwo = false;
              pageThree = false;
            });
          },
          child: Container(
              height: 35,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: pageOne ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: TextDefault(
                color: pageOne ? Colors.white : Colors.black,
                text: "Delivered",
              )),
        ),
        InkWell(
          onTap: () {
            widget.onTap(1);
            setState(() {
              pageOne = false;
              pageTwo = true;
              pageThree = false;
            });
          },
          child: Container(
              height: 35,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: pageTwo ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: TextDefault(
                color: pageTwo ? Colors.white : Colors.black,
                text: "Processing",
              )),
        ),
        InkWell(
          onTap: () {
            widget.onTap(2);
            setState(() {
              pageOne = false;
              pageTwo = false;
              pageThree = true;
            });
          },
          child: Container(
              height: 35,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: pageThree ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: TextDefault(
                  color: pageThree ? Colors.white : Colors.black,
                  text: "Cancelled")),
        )
      ],
    );
  }
}
