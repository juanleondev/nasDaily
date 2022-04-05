import 'package:flutter/material.dart';

class NasDailyThemeData {
  static ThemeData theme() => ThemeData(
      primarySwatch: Colors.green,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20),
          color: Colors.black87,
          centerTitle: true,
          elevation: 0));
}
