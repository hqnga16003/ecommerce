import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault(
      {super.key,
      required this.width,
      this.height,
      required this.text,
      required this.onPressed});

  final double width;
  final double? height;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffDB3022),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: onPressed,
            child: TextButtonDefault(text: text,color: Colors.white,)));
  }
}


class ButtonOutlineDefault extends StatelessWidget {
  const ButtonOutlineDefault(
      {super.key,
        required this.width,
        this.height,
        required this.text,
        required this.onPressed});

  final double width;
  final double? height;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1, color: Colors.black),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: onPressed,
            child: TextButtonDefault(text: text,color: Colors.black,)));
  }
}
class ButtonLoginOther extends StatelessWidget {
  const ButtonLoginOther(
      {super.key,
      required this.img,
      required this.width,
      required this.height,
      required this.onPressed});

  final String img;
  final double width;
  final double height;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffFFFFFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          onPressed: onPressed,
          child: Image.asset(img),
        ));
  }
}

class ButtonAnimation extends StatelessWidget {
  const ButtonAnimation(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      required this.onPressed});

  final double width;
  final double height;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: EasyButton(
          idleStateWidget: TextButtonDefault(text: text,color: Colors.white,),
          loadingStateWidget: const CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
          useEqualLoadingStateWidgetDimension: true,
          useWidthAnimation: false,
          borderRadius: 10.0,
          elevation: 2.0,
          contentGap: 6.0,
          buttonColor: const Color(0xffDB3022),
          onPressed: onPressed,
        ));
  }
}
