import 'dart:convert';
import 'package:catalog/pages/product.item.dart';
import 'package:catalog/pages/products.details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<dynamic> products = [];

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    http.get(Uri.parse("http://192.168.1.7:9000/Products")).then((resp) {
      setState(() {
        products = json.decode(resp.body);
      });
    }).catchError((err) {
      print("*****************ERRRRRRRRRRRRRRRR*******************");
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products "),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ProductItem(
              product: products[index],
              details: false,
            );
          },
          itemCount: products.length,
        ));
  }
}
