import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/components/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../components/my_button.dart';
import '../../../../components/my_text.dart';

@RoutePage()
class Branch extends StatelessWidget {
  const Branch({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const TextStyle textStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);

    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const TextAppBar(text: "Brand"),
          leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: size.width,
        height: size.height * 0.1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonOutlineDefault(
                  width: size.width * 0.4, text: "Discard", onPressed: () {}),
              ButtonDefault(
                  width: size.width * 0.4, text: "Apply", onPressed: () {}),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldSearch(hintText: "Search"),
                Gap(10),
                _ItemBranch(title: "Adidas"),
                Gap(10),
                _ItemBranch(title: "Adidas Originals"),
                Gap(10),
                _ItemBranch(title: "Blend"),
                Gap(10),
                _ItemBranch(title: "Boutique Moschino"),
                Gap(10),
                _ItemBranch(title: "Champion"),
                Gap(10),
                _ItemBranch(title: "Diesel"),
                Gap(10),
                _ItemBranch(title: "Jack & Jones"),
                Gap(10),
                _ItemBranch(title: "Naf Naf"),
                Gap(10),
                _ItemBranch(title: "Red Valentino"),
                Gap(10),
                _ItemBranch(title: "s.Oliver"),

              ]),
        ),
      ),
    );
  }
}

class _ItemBranch extends StatefulWidget {
  const _ItemBranch({super.key, required this.title});

  final String title;

  @override
  State<_ItemBranch> createState() => _ItemBranchState();
}

class _ItemBranchState extends State<_ItemBranch> {
  bool isChoose = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style:  TextStyle(
              color: isChoose ? const Color(0xffDB3022) : Colors.black,
              fontWeight: isChoose ? FontWeight.bold : FontWeight.w400,
              fontSize: 16),
        ),
        Checkbox(
          activeColor: const Color(0xffDB3022),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          checkColor: Colors.white,
          value: isChoose,
          onChanged: (bool? value) {
            setState(() {
              isChoose = value!;
            });
          },
        )
      ],
    );
  }
}
