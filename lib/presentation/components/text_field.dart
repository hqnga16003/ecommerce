import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {super.key,
      required this.label,
      this.obscureText,
      this.focusNode,
      this.validatorTextField,
      this.onFieldSubmitted, required this.textEditingController, this.icon, this.onTapIcon});

  final String label;
  final TextEditingController textEditingController;
  final bool? obscureText;
  final FocusNode? focusNode;
  final Function(String value)? validatorTextField;
  final Function(String value)? onFieldSubmitted;
  final IconData? icon;
  final Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      decoration: InputDecoration(
          suffixIcon: InkWell(onTap:onTapIcon ,child: Icon(icon)),
          suffixIconColor: Colors.grey,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF01F0E))),
          label: Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff9B9B9B),
                fontSize: 11),
          ),
          hintText: label,
          hintStyle: const TextStyle(
              color: Color(0xff9B9B9B),
              fontSize: 14,
              fontWeight: FontWeight.w500),
          filled: true,
          fillColor: const Color(0xffFFFFFF),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide.none)),
      obscureText: obscureText ?? false,
      validator: (value) {
        if (validatorTextField != null) {
          return validatorTextField!(value!);
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}



class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch(
      {super.key,
        required this.hintText,
        this.onFieldSubmitted,
        this.textEditingController});

  final String hintText;
  final Function(String value)? onFieldSubmitted;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(prefixIcon: const Icon(Icons.search,color: Color(0xff8E8E93)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff9B9B9B),fontSize: 16,fontWeight: FontWeight.w400),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,

    );
  }
}


class TextFieldInputCart extends StatelessWidget {
  const TextFieldInputCart({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff9B9B9B),fontSize: 14,fontWeight: FontWeight.w500),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),

    );
  }
}


class TextFieldInput extends StatelessWidget {
  const TextFieldInput({super.key, required this.hintText, required this.textEditingController});
  final String hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff9B9B9B),fontSize: 14,fontWeight: FontWeight.w500),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),

    );
  }
}
