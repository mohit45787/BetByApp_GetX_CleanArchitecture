import 'package:BetByApp/app/constants/appDimen/appDimen.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/appColors/appColors.dart';

class Utils {
  Widget aapBackGround(BuildContext ctx) {
    return Container(
      height: MediaQuery.of(ctx).size.height,
      width: MediaQuery.of(ctx).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [
        0.4,
        0.6,
        0.9
      ], colors: [
        AppColors.colorLightPurple,
        AppColors.colorOrange,
        Colors.black,
      ])),
    ).blurred(blur: AppDimen().blur, colorOpacity: AppDimen().colorOpacity);
  }

  static String getPrintableDate(String dt, String format) {
    final DateFormat formatter = DateFormat(format);
    var dt1 = DateTime.parse(dt);

    // return "${dt1.year.toString()}-${dt1.month.toString().padLeft(2, '0')}-${dt1.day.toString().padLeft(2, '0')}";
    return formatter.format(dt1);
  }
}
