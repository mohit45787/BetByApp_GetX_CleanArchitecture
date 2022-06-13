import 'package:flutter/material.dart';

import '../../../constants/appAssets/appAssets.dart';
import '../../../constants/appColors/appColors.dart';
import '../../../constants/appDimen/appDimen.dart';
import '../../../constants/appString/appString.dart';
import '../../../core/base/base_view.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../../utils/textStyles.dart';
import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  // final ctrl = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Utils().aapBackGround(context),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: SplashController().navigateToNext(), child: Image.asset(AppAssets.appIcon)),
                SizedBox(
                  height: AppDimen.unitHeight * 8,
                ),
                Text(
                  AppStrings.appTitle,
                  style: TextStyles.boldTextStyle(AppDimen.unitHeight * 16, AppColors.colorWhite),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(
      appBarTitleText: 'Splash',
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    /*return Scaffold(
      body: Stack(
        children: [
          Utils().aapBackGround(context),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.appIcon),
                SizedBox(
                  height: AppDimen.unitHeight * 8,
                ),
                Text(
                  AppStrings.appTitle,
                  style: TextStyles.boldTextStyle(AppDimen.unitHeight * 16, AppColors.colorWhite),
                )
              ],
            ),
          ),
        ],
      ),
    );*/
    return Container();
  }
}
