import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.color, required this.title});

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)),
      padding:
      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child:  Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 11),
      ),
    );
  }
}
