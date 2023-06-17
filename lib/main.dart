import 'package:catalog/pages/HomePage.dart';
import 'package:catalog/pages/products.page.dart';
import 'package:catalog/pages/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyAppTheme.themes[0],
      routes: {
        "/home": (context) => HomePage(),
        "/products": (context) => ProductsPage()
      },
      initialRoute: "/home",
    );
  }
}
