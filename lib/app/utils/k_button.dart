// import 'package:betbyapp/app/value/appColors/appColors.dart';
// import 'package:betbyapp/ui_module/utils/textStyles.dart';
// import 'package:flutter/material.dart';
//
// import '../../app/value/appDimen/appDimen.dart';
//
// // ignore: camel_case_types
// class kButton extends StatelessWidget {
//   const kButton(
//       {Key? key,
//       required this.title,
//       this.onClick,
//       this.bgColor = AppColors.colorOrange,
//       this.textColor = AppColors.colorWhite})
//       : super(key: key);
//
//   final String title;
//   final VoidCallback? onClick;
//   final Color bgColor;
//   final Color textColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: AppDimen.unitHeight * 40,
//         child: ElevatedButton(
//           onPressed: onClick,
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(bgColor),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//             ),
//           ),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyles.boldTextStyle(
//                   AppDimen.unitHeight * 12, AppColors.colorWhite),
//             ),
//           ),
//         ));
//   }
// }
