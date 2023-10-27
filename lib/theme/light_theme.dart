import 'package:flutter/material.dart';

class LightTheme {
  late ThemeData theme;
  final _lightColor = _LightColor();

  LightTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)))
      ),
      scaffoldBackgroundColor: Colors.white12,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.green),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
                onPrimary: Colors.pink, onSecondary: _lightColor.blueMania)),
        colorScheme: ColorScheme.light(),
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(subtitle1: TextStyle(color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 37, 6, 5);
  final Color blueMania = const Color.fromARGB(95, 188, 248, 1);
}
