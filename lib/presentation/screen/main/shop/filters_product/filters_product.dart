import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/components/item_choose.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/router/AppRouter.gr.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/filters_product/bloc/filters_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../app/locator/locator.dart';
import '../bloc/shop_bloc.dart';

@RoutePage()
class FiltersProduct extends StatefulWidget {
  const FiltersProduct({
    super.key,
  });

  @override
  State<FiltersProduct> createState() => _FiltersProductState();
}

class _FiltersProductState extends State<FiltersProduct> {
  SfRangeValues _values = const SfRangeValues(0.0, 100.0);

  final ShopBloc shopBloc = getIt<ShopBloc>();
  final FiltersProductBloc filtersProductBloc = getIt<FiltersProductBloc>();

  @override
  void initState() {
    super.initState();
    filtersProductBloc.add(GetAllBrandEvent());
  }

  @override
  Widget build(BuildContext context) {
    filtersProductBloc.add(InitFiltersEvent());
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
                  width: size.width * 0.4,
                  text: "Discard",
                  onPressed: () {
                    filtersProductBloc.add(DiscardFiltersEvent());
                  }),
              ButtonDefault(
                  width: size.width * 0.4,
                  text: "Apply",
                  onPressed: ()  {
                    shopBloc.add(FiltersProductsEvent(
                        _values.start,
                        _values.end,
                        filtersProductBloc.colors,
                        filtersProductBloc.sizes,
                        filtersProductBloc.categories,
                        filtersProductBloc.brands));

                    AutoRouter.of(context).pop();
                  }),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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
              values: _values,
              valuesChange: (value) {
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
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddColorsEvent("Black"));
                      } else {
                        filtersProductBloc.add(RemoveColorEvent("Black"));
                      }
                    },
                  ),
                  _ItemChooseColor(
                    color: const Color(0xffF6F6F6),
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddColorsEvent("White"));
                      } else {
                        filtersProductBloc.add(RemoveColorEvent("White"));
                      }
                    },
                  ),
                  _ItemChooseColor(
                    color: const Color(0xffB82222),
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddColorsEvent("Red"));
                      } else {
                        filtersProductBloc.add(RemoveColorEvent("Red"));
                      }
                    },
                  ),
                  _ItemChooseColor(
                    color: const Color(0xffBEA9A9),
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddColorsEvent("Brown"));
                      } else {
                        filtersProductBloc.add(RemoveColorEvent("Brown"));
                      }
                    },
                  ),
                  _ItemChooseColor(
                    color: const Color(0xffE2BB8D),
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddColorsEvent("Yellow"));
                      } else {
                        filtersProductBloc.add(RemoveColorEvent("Yellow"));
                      }
                    },
                  ),
                  _ItemChooseColor(
                    color: const Color(0xff151867),
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddColorsEvent("Blue"));
                      } else {
                        filtersProductBloc.add(RemoveColorEvent("Blue"));
                      }
                    },
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
              child: Row(
                children: [
                  ItemChoose(
                    title: "XS",
                    width: 50,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddSizeEvent("XS"));
                      } else {
                        filtersProductBloc.add(RemoveSizeEvent("XS"));
                      }
                    },
                  ),
                  const Gap(10),
                  ItemChoose(
                    title: "S",
                    width: 50,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddSizeEvent("S"));
                      } else {
                        filtersProductBloc.add(RemoveSizeEvent("S"));
                      }
                    },
                  ),
                  const Gap(10),
                  ItemChoose(
                    title: "M",
                    width: 50,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddSizeEvent("M"));
                      } else {
                        filtersProductBloc.add(RemoveSizeEvent("M"));
                      }
                    },
                  ),
                  const Gap(10),
                  ItemChoose(
                    title: "L",
                    width: 50,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddSizeEvent("L"));
                      } else {
                        filtersProductBloc.add(RemoveSizeEvent("L"));
                      }
                    },
                  ),
                  const Gap(10),
                  ItemChoose(
                    title: "XL",
                    width: 50,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddSizeEvent("XL"));
                      } else {
                        filtersProductBloc.add(RemoveSizeEvent("XL"));
                      }
                    },
                  ),
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
                    title: "All",
                    width: size.width * 0.25,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddCategoryEvent("All"));
                      } else {
                        filtersProductBloc.add(RemoveCategoryEvent("All"));
                      }
                    },
                  ),
                  ItemChoose(
                    title: "Women",
                    width: size.width * 0.25,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddCategoryEvent("Women"));
                      } else {
                        filtersProductBloc.add(RemoveCategoryEvent("Women"));
                      }
                    },
                  ),
                  ItemChoose(
                    title: "Men",
                    width: size.width * 0.25,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddCategoryEvent("Men"));
                      } else {
                        filtersProductBloc.add(RemoveCategoryEvent("Men"));
                      }
                    },
                  ),
                  ItemChoose(
                    title: "Boys",
                    width: size.width * 0.25,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddCategoryEvent("Boys"));
                      } else {
                        filtersProductBloc.add(RemoveCategoryEvent("Boys"));
                      }
                    },
                  ),
                  ItemChoose(
                    title: "Girls",
                    width: size.width * 0.25,
                    height: 50,
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc.add(AddCategoryEvent("Girls"));
                      } else {
                        filtersProductBloc.add(RemoveCategoryEvent("Girls"));
                      }
                    },
                  )
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
                          AutoRouter.of(context).push(
                              Brand(brands: filtersProductBloc.listBrands));
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  const Gap(5),
                  BlocConsumer(listener: (context, state) {
                    if(state is DiscardState){
                      AutoRouter.of(context).pop();
                    }
                  },
                    bloc: filtersProductBloc,
                    builder: (context, state) {
                      if (state is SubmittedBrandState) {
                        return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: TextSub(
                                text: state.brands,
                                color: const Color(0xff9B9B9B)));
                      }

                      if (state is DiscardState) {
                        return const SizedBox();
                      }

                      return const SizedBox();
                    },
                  )
                ],
              ))
        ]),
      ),
    );
  }

  void clickItem(bool value, String item, List<String> list) {
    if (value) {
      list.add(item);
    } else {
      list.remove(item);
    }
  }
}

class _ItemChooseColor extends StatefulWidget {
  _ItemChooseColor({super.key, required this.color, required this.onTap});

  bool isChoose = false;

  final Color color;
  final Function(bool) onTap;

  @override
  State<_ItemChooseColor> createState() => _ItemChooseColorState();
}

class _ItemChooseColorState extends State<_ItemChooseColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: Colors.transparent,
          border: Border.all(
            color:
                widget.isChoose ? const Color(0xffDB3022) : Colors.transparent,
            width: 1.0,
          )),
      width: 55,
      height: 55,
      alignment: Alignment.center,
      // where to position the child
      child: InkWell(
        onTap: () {
          setState(() {
            widget.isChoose = !widget.isChoose;
            widget.onTap(widget.isChoose);
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
