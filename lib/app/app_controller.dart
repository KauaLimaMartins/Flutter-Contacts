import 'package:flutter/foundation.dart';

import './models/app_config_model.dart';

class ThemeController {
  static ThemeController instance = ThemeController._();

  ThemeController._();

  final config = AppConfigModel();
  bool get isDark => this.config.themeSwitcher.value;
  ValueNotifier<bool> get themeSwitcher => this.config.themeSwitcher;

  changeTheme(bool value) {
    this.themeSwitcher.value = value;
  }
}
