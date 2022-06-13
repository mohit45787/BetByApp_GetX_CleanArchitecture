// import 'package:flutter/material.dart';
//
// import '../../constants/appColors/appColors.dart';
// import '../../constants/appDimen/appDimen.dart';
//
// // ignore: must_be_immutable
// class StepProgressView extends StatelessWidget {
//   final double _width;
//   final List<String> _icons;
//   final List<String> _titles;
//   final int _curStep;
//   final Color _activeColor;
//   final Color _inactiveColor = AppColors.lightOrange;
//
//   StepProgressView(
//       {Key? key,
//       required List<String> icons,
//       required int curStep,
//       required List<String> titles,
//       required double width,
//       required Color color})
//       : _icons = icons,
//         _titles = titles,
//         _curStep = curStep,
//         _width = width,
//         _activeColor = AppColors.colorOrange,
//
//         //assert(curStep > 0 == true && curStep <= icons.length),
//         // assert(width > 0),
//         super(key: key);
//
//   final List<String> titles = ["step1", "step2", "step3", "step4", "step5"];
//   int curStep = 2;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.only(
//             top: 20.0, left: 20, right: 20),
//         width: _width,
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: _iconViews(),
//             ),
//             SizedBox(
//               height: AppDimen.unitHeight * 8,
//             ),
//             // ignore: unnecessary_null_comparison
//             if (_titles != null)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: _titleViews(),
//               ),
//           ],
//         ));
//   }
//
//   List<Widget> _iconViews() {
//     final int MAX_PASSWORD_SIZE = 17;
//     var list = <Widget>[];
//     _icons.asMap().forEach((i, icon) {
//       //colors according to state
//       var circleColor = (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
//
//       var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
//
//       var iconColor = (i == 0 || _curStep > i + 1) ? _inactiveColor : _activeColor;
//
//       list.add(
//         //dot with icon view
//         Container(
//           width: AppDimen.unitHeight * 7,
//           height: AppDimen.unitHeight * 7,
//           padding: const EdgeInsets.all(0),
//           child: Center(
//             child: Text(
//               icon,
//               style: TextStyle(color: iconColor, fontSize: AppDimen.unitHeight * 5),
//             ),
//           ),
//           decoration: BoxDecoration(
//             color: circleColor,
//             shape: BoxShape.circle,
//
//             // borderRadius: const BorderRadius.all(Radius.circular(25.0)),
//           ),
//         ),
//       );
//
//       ///line between icons
//       if (i != _icons.length - 1) {
//         list.add(Container(
//           height: AppDimen.unitHeight * 3,
//           width: AppDimen.screenWidth * 8,
//           color: lineColor,
//         ));
//       }
//     });
//
//     return list;
//   }
//
//   List<Widget> _titleViews() {
//     var list = <Widget>[];
//     _titles.asMap().forEach((i, text) {
//       list.add(Text(text, style: TextStyle(color: _activeColor)));
//     });
//
//     return list;
//   }
// }
