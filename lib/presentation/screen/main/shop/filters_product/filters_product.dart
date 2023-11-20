import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/components/item_choose.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../app/locator/locator.dart';
import '../bloc/shop_bloc.dart';

@RoutePage()
class FiltersProduct extends StatefulWidget {
  const FiltersProduct({super.key,});


  @override
  State<FiltersProduct> createState() => _FiltersProductState();
}

class _FiltersProductState extends State<FiltersProduct> {
   SfRangeValues _values =  SfRangeValues(10.0, 18.0);

  final ShopBloc shopBloc = getIt<ShopBloc>();

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
          title: const TextAppBar(text: "Filters"),
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
                  width: size.width * 0.4,
                  text: "Apply",
                  onPressed: () {
                    shopBloc.add(
                        FiltersListProductEvent(_values.start, _values.end));

                    //AutoRouter.of(context).push(ProductCategory(title: widget.title));
                  }),
            ],
          ),
        ),
      ),
      body: BlocListener(
        bloc: shopBloc,
        listener: (BuildContext context, state) {
          if(state is FilteredProductsState){
            AutoRouter.of(context).pop();
          }
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.03),
              child: const Text("Price range", style: textStyle)),
          Container(
            height: size.height * 0.1,
            width: size.width,
            color: Colors.white,
            child: MySlider(
              values: _values, valuesChange: (value ) {
                _values = value;
            },
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.03),
              child: const Text("Colors", style: textStyle)),
          Container(
            height: size.height * 0.11,
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ItemChooseColor(
                    color: const Color(0xff020202),
                  ),
                  _ItemChooseColor(
                    color: const Color(0xffF6F6F6),
                  ),
                  _ItemChooseColor(
                    color: const Color(0xffB82222),
                  ),
                  _ItemChooseColor(
                    color: const Color(0xffBEA9A9),
                  ),
                  _ItemChooseColor(
                    color: const Color(0xffE2BB8D),
                  ),
                  _ItemChooseColor(
                    color: const Color(0xff151867),
                  )
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.03),
              child: const Text("Sizes", style: textStyle)),
          Container(
            height: size.height * 0.1,
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: const Row(
                children: [
                  ItemChoose(title: "XS", width: 50, height: 50),
                  Gap(10),
                  ItemChoose(title: "S", width: 50, height: 50),
                  Gap(10),
                  ItemChoose(title: "M", width: 50, height: 50),
                  Gap(10),
                  ItemChoose(title: "L", width: 50, height: 50),
                  Gap(10),
                  ItemChoose(title: "XL", width: 50, height: 50),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.03),
              child: const Text("Category", style: textStyle)),
          Container(
            height: size.height * 0.2,
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Wrap(
                runAlignment: WrapAlignment.spaceAround,
                spacing: 10.0,
                children: <Widget>[
                  ItemChoose(
                      title: "All", width: size.width * 0.25, height: 50),
                  ItemChoose(
                      title: "Women", width: size.width * 0.25, height: 50),
                  ItemChoose(
                      title: "Men", width: size.width * 0.25, height: 50),
                  ItemChoose(
                      title: "Boys", width: size.width * 0.25, height: 50),
                  ItemChoose(
                      title: "Girls", width: size.width * 0.25, height: 50)
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Brand", style: textStyle),
                      InkWell(
                        onTap: () {
                          AutoRouter.of(context).push(const Branch());
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  const Gap(5),
                  const TextSub(
                      text: "adidas Originals, Jack & Jones, s.Oliver",
                      color: Color(0xff9B9B9B))
                ],
              ))
        ]),
      ),
    );
  }
}

class _ItemChooseColor extends StatefulWidget {
  _ItemChooseColor({super.key, required this.color});

  final Color color;

  @override
  State<_ItemChooseColor> createState() => _ItemChooseColorState();
}

class _ItemChooseColorState extends State<_ItemChooseColor> {
  bool isChoose = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: Colors.transparent,
          border: Border.all(
            color: isChoose ? const Color(0xffDB3022) : Colors.transparent,
            width: 1.0,
          )),
      width: 55,
      height: 55,
      alignment: Alignment.center,
      // where to position the child
      child: InkWell(
        onTap: () {
          setState(() {
            isChoose = !isChoose;
          });
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              color: widget.color,
              width: 45,
              height: 45,
            )),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  MySlider({super.key, required this.values, required this.valuesChange});

  SfRangeValues values;
  final Function(SfRangeValues) valuesChange;

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    final String start = widget.values.start.toString();
    final String end = widget.values.end.toString();

    final int numberStart = double.parse(start).round();
    final int numberEnd = double.parse(end).round();

    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$$numberStart",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\$$numberEnd",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SfRangeSlider(
          inactiveColor: const Color(0xff9B9B9B),
          activeColor: const Color(0xffDB3022),
          numberFormat: NumberFormat("\$"),
          min: 0,
          max: 100,
          values: widget.values,
          interval: 1,
          minorTicksPerInterval: 1,
          onChanged: (SfRangeValues values) {
            setState(() {
              widget.values = values;
             widget.valuesChange(values);
            });
          },
        )
      ],
    );
  }
}
