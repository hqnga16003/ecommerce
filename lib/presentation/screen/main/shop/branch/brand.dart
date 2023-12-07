import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/presentation/components/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../app/locator/locator.dart';
import '../../../../components/my_button.dart';
import '../../../../components/my_text.dart';
import '../filters_product/bloc/filters_product_bloc.dart';

@RoutePage()
class Brand extends StatefulWidget {
  const Brand({super.key, required this.brands});

  final List<String> brands;

  @override
  State<Brand> createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  final FiltersProductBloc filtersProductBloc = getIt<FiltersProductBloc>();

  List<String> currentBrands = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const TextAppBar(text: "Brand"),
          leading: IconButton(
            onPressed: () {
              for (var element in currentBrands) {
                filtersProductBloc.brands.remove(element);
              }
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
                    filtersProductBloc.add(DiscardBrandEvent());

                  }),
              ButtonDefault(
                  width: size.width * 0.4,
                  text: "Apply",
                  onPressed: () {
                    filtersProductBloc.add(SubmittedBrandEvent());
                  }),
            ],
          ),
        ),
      ),
      body: BlocListener(
        bloc: filtersProductBloc,
        listener: (context, state) {
          if (state is SubmittedBrandState) {
            AutoRouter.of(context).pop();
          }
        },
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TextFieldSearch(hintText: "Search"),
            const Gap(10),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: widget.brands.length,
                itemBuilder: (context, index) {
                  return _ItemBrand(
                    title: widget.brands[index],
                    onTap: (value) {
                      if (value) {
                        filtersProductBloc
                            .add(AddBrandEvent(widget.brands[index]));
                        currentBrands.add(widget.brands[index]);
                      } else {
                        filtersProductBloc
                            .add(RemoveBrandEvent(widget.brands[index]));
                        currentBrands.remove(widget.brands[index]);
                      }
                    },
                    isChoose: filtersProductBloc.brands
                        .contains(widget.brands[index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Gap(15),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _ItemBrand extends StatefulWidget {
  _ItemBrand(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isChoose});

  final String title;
  final Function(bool) onTap;
  bool isChoose;

  @override
  State<_ItemBrand> createState() => _ItemBrandState();
}

class _ItemBrandState extends State<_ItemBrand> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              color: widget.isChoose ? const Color(0xffDB3022) : Colors.black,
              fontWeight: widget.isChoose ? FontWeight.bold : FontWeight.w400,
              fontSize: 16),
        ),
        Checkbox(
          activeColor: const Color(0xffDB3022),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          checkColor: Colors.white,
          value: widget.isChoose,
          onChanged: (bool? value) {
            setState(() {
              widget.isChoose = value!;
              widget.onTap(value);
            });
          },
        )
      ],
    );
  }
}
