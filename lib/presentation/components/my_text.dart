import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextDefault extends StatelessWidget {
  const TextDefault({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 14),
    );
  }
}

class TextButtonDefault extends StatelessWidget {
  const TextButtonDefault({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 14),
    );
  }
}

class TextError extends StatelessWidget {
  const TextError({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xffF01F0E), fontWeight: FontWeight.w400, fontSize: 11),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xff222222), fontWeight: FontWeight.w700, fontSize: 34),
    );
  }
}

class TextSub extends StatelessWidget {
  const TextSub({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: 11),
    );
  }
}

class TextNameProduct extends StatelessWidget {
  const TextNameProduct({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

class TextAppBar extends StatelessWidget {
  const TextAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class TextBottomSheet extends StatelessWidget {
  const TextBottomSheet({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18),
    );
  }
}
