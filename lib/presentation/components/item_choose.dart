import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemChoose extends StatefulWidget {
  const ItemChoose({super.key, required this.title, required this.width, required this.height});

  final String title;
  final double width, height;

  @override
  State<ItemChoose> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemChoose> {
  bool isChoose = false;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        setState(() {
          isChoose = !isChoose;
        });
      },
      child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isChoose ? const Color(0xffDB3022) : Colors.transparent,
              border: Border.all(
                color: isChoose ? Colors.transparent : const Color(0xff9B9B9B),
                width: 1.0,
              )),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: isChoose ? Colors.white : Colors.black),
            ),
          )),
    );
  }
}
