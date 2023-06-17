import 'package:flutter/material.dart';

class MyAppTheme {
  static List<ThemeData> themes = [
    ThemeData(
        primaryColor: Colors.lightGreen,
        appBarTheme: AppBarTheme(color: Colors.greenAccent),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 22),
          bodyMedium: TextStyle(fontSize: 20),
          bodySmall: TextStyle(fontSize: 18),
        ),
        iconTheme: const IconThemeData(
          size: 18,
        )),
    ThemeData(
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(color: Colors.red),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 22),
          bodyMedium: TextStyle(fontSize: 20),
          bodySmall: TextStyle(fontSize: 18),
        ),
        iconTheme: const IconThemeData(
          size: 18,
        )),
  ];
}
