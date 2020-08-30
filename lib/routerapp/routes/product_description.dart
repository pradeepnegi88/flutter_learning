import 'package:flutter/material.dart';
import 'package:myapp/routerapp/model/product.dart';

class ProductDescription extends StatelessWidget {
  static const route = "/product_description";
  final Product product;
  ProductDescription({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductDescription"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Product name is ${product.name}'),
            Text('Product price is ${product.price}')
          ],
        ),
      ),
    );
  }
}
