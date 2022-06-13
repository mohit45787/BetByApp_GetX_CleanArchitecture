import 'package:flutter/material.dart';

import '../constants/appColors/appColors.dart';

class TextStyles {
  static TextStyle normalTextStyle(double fontSize, Color color) {
    return TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.w300);
  }

  static TextStyle regularTextStyle(double fontSize, Color color) {
    return TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.w400);
  }

  static TextStyle boldTextStyle(double fontSize, Color color) {
    return TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.w500);
  }

  static TextStyle largeBoldTextStyle(double fontSize, Color color) {
    return TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.w700);
  }

  static TextStyle underLineTextStyle(double fontSize, Color color) {
    return TextStyle(
        fontSize: fontSize, color: color, fontWeight: FontWeight.w300, decoration: TextDecoration.underline);
  }

  static TextField textFieldStyle(String text) {
    return TextField(
      decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          hintStyle: const TextStyle(
            color: AppColors.hintColor,
          )),
    );
  }

  static TextField textFieldStyle2(String text) {
    return TextField(
        decoration: InputDecoration(
      hintText: text,
      border: InputBorder.none,
      // hintStyle: TextStyle(
      //     color: AppColors.hintColor2, fontSize: AppDimen.unitHeight * 12)),
    ));
  }
}
