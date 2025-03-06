import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.deepPurple,
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
