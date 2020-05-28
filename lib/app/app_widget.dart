import 'package:flutter/material.dart';

import './screens/home/home_screen.dart';
import './screens/contact/contact_screen.dart';

import './app_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: ThemeController.instance.themeSwitcher,
        builder: (context, isDark, child) {
          return MaterialApp(
            theme: ThemeData(
              brightness: isDark ? Brightness.dark : Brightness.light,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primarySwatch: Colors.teal,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Contact List',
            home: ContactScreen(),
          );
        });
  }
}
