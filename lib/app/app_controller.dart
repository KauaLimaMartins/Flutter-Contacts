import 'package:flutter/foundation.dart';

import './models/app_config_model.dart';
import './interfaces/local_storage_interface.dart';
import './services/shared_local_storage_service.dart';

class ThemeController {
  static ThemeController instance = ThemeController._();

  ThemeController._() {
    storage.get('isDark').then((value) {
      if (value != null) {
        this.changeTheme(value);
      }
    });
  }

  final config = AppConfigModel();
  bool get isDark => this.config.themeSwitcher.value;
  ValueNotifier<bool> get themeSwitcher => this.config.themeSwitcher;

  final ILocalStorage storage = SharedLocalStorageService();

  changeTheme(bool value) {
    this.themeSwitcher.value = value;

    storage.put('isDark', value);
  }
}
