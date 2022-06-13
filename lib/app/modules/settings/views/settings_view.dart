import 'package:flutter/material.dart';

import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/settings/controllers/settings_controller.dart';
import '/app/modules/settings/widgets/item_settings_widgets.dart';
import '../../../constants/appString/appString.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: AppStrings.bottomNavSettings,
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ItemSettings(
          title: AppStrings.settingsTheme,
          prefixImage: 'ic_theme.png',
          suffixImage: 'arrow_forward.svg',
          onTap: _onThemeItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: AppStrings.settingsLanguage,
          prefixImage: 'ic_language.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: _onLanguageItemClicked,
        ),
        _getHorizontalDivider(),
        ItemSettings(
          title: AppStrings.settingsFontSize,
          prefixImage: 'ic_font_size.svg',
          suffixImage: 'arrow_forward.svg',
          onTap: _onFontSizeItemClicked,
        ),
        _getHorizontalDivider(),
      ],
    );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  void _onThemeItemClicked() {
    showToast('Theme: Development in progress');
  }

  void _onLanguageItemClicked() {
    showToast('Language: Development in progress');
  }

  void _onFontSizeItemClicked() {
    showToast('Font Size: Development in progress');
  }
}
