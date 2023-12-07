import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/app_assets.dart';
import 'package:ecommerce_app/app/locator/locator.dart';
import 'package:ecommerce_app/model/address.dart';
import 'package:ecommerce_app/presentation/components/app_bar.dart';
import 'package:ecommerce_app/presentation/components/my_button.dart';
import 'package:ecommerce_app/presentation/components/my_text.dart';
import 'package:ecommerce_app/presentation/components/text_field.dart';
import 'package:ecommerce_app/presentation/screen/main/bag/add_address/address_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../components/bottom_sheet_select_size.dart';

@RoutePage()
class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  AddressBloc addressBloc = getIt<AddressBloc>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener(bloc: addressBloc,
        listener: (context, state) {
          AutoRouter.of(context).pop();
        },
        child: Scaffold(
            backgroundColor: const Color(0xffF9F9F9),
            appBar: MyAppBar(
                title: "Adding Shipping Address",
                icon: const Icon(Icons.search),
                onPressedSearch: () {}),
            body: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldInput(
                        hintText: "Full name",
                        textEditingController: nameController),
                    const Gap(15),
                    TextFieldInput(
                        hintText: "Address",
                        textEditingController: addressController),
                    const Gap(15),
                    TextFieldInput(
                        hintText: "City",
                        textEditingController: cityController),
                    const Gap(15),
                    TextFieldInput(
                        hintText: "State/Province/Region",
                        textEditingController: stateController),
                    const Gap(15),
                    TextFieldInput(
                        hintText: "Zip Code (Postal Code)",
                        textEditingController: zipController),
                    const Gap(15),
                    TextFieldInput(
                        hintText: "Country",
                        textEditingController: countryController),
                    const Gap(30),
                    ButtonDefault(
                        width: size.width,
                        height: 50,
                        text: "SAVE ADDRESS",
                        onPressed: () {
                          addressBloc.add(AddAddressEvent(
                              nameController.text,
                              addressController.text,
                              cityController.text,
                              stateController.text,
                              zipController.text,
                              countryController.text));
                        })
                  ]),
            )));
  }
}
