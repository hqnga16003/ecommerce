import 'package:flutter/widgets.dart';

class FrameSize {
  static void init({
    required context,
  }) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    heightButton = FrameSize.screenWidth * 0.12;
    padding = FrameSize.screenWidth * 0.05;
  }

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double heightButton;
  static late double padding;
}
