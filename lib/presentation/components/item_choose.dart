import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemChoose extends StatefulWidget {
  ItemChoose(
      {super.key,
      required this.title,
      required this.width,
      required this.height,
      required this.onTap});

  bool isChoose = false;

  final String title;
  final double width, height;
  final Function(bool) onTap;

  @override
  State<ItemChoose> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemChoose> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isChoose = !widget.isChoose;
          widget.onTap(widget.isChoose);
        });
      },
      child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.isChoose
                  ? const Color(0xffDB3022)
                  : Colors.transparent,
              border: Border.all(
                color: widget.isChoose
                    ? Colors.transparent
                    : const Color(0xff9B9B9B),
                width: 1.0,
              )),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: widget.isChoose ? Colors.white : Colors.black),
            ),
          )),
    );
  }
}
