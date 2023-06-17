import 'package:catalog/pages/products.details.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final dynamic product;
  final bool details;
  ProductItem({Key? key, required this.product, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              color: Colors.greenAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    child: Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${product["name"]}",
                            ),
                            Text("MAD ${product["Price"]}"),
                            // Text("${products[index]["stars"]}"),
                            if (product["promotion"] == true)
                              const Icon(
                                Icons.paid_rounded,
                                color: Colors.redAccent,
                              ),
                            Row(
                              children: [
                                for (int i = 0; i < product["stars"]; i++)
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellowAccent,
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductsDetails(
                                    productId: product['id'],
                                  )));
                    },
                    child: Image(
                        width: 200, image: AssetImage("${product['image']}")),
                  )
                ],
              ),
            ),
            if (details == true)
              Card(
                child: Text("${product['description']}"),
              )
          ],
        ),
      ),
    );
  }
}
