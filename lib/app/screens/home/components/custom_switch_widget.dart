import 'package:flutter/material.dart';

import 'package:contatos/app/app_controller.dart';

class CustomSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: ThemeController.instance.isDark,
      onChanged: (bool value) {
        ThemeController.instance.changeTheme(value);
      },
    );
  }
}
