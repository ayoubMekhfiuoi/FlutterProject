import 'package:catalog/widget/drawer.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyAppDrawer(),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
