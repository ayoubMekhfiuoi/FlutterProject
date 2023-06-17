import 'dart:convert';
import 'package:catalog/pages/product.item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsDetails extends StatefulWidget {
  int productId;

  ProductsDetails({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  dynamic product = null;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    http
        .get(Uri.parse("http://192.168.1.7:9000/Products/${widget.productId}"))
        .then((resp) {
      setState(() {
        product = json.decode(resp.body);
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
          title: Text("Products Details ==>${widget.productId}"),
        ),
        body: Center(
            child: (product != null)
                ? ProductItem(
                    product: product,
                    details: true,
                  )
                : Scaffold(
                    body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          await Future.delayed(const Duration(seconds: 5));
//for demo I had use delayed method. When you integrate use your api //call here.
                          setState(() {
                            _isLoading = false;
                          });
                        },
                        child: const Text("Click to start fetching"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(50),
                        margin: const EdgeInsets.all(50),
                        color: Colors.blue[100],
//widget shown according to the state
                        child: Center(
                          child: !_isLoading
                              ? const Text("Loading Complete")
                              : const CircularProgressIndicator(),
                        ),
                      )
                    ],
                  ))));
  }
}
