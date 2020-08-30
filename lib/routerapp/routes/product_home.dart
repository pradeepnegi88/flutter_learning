import 'package:flutter/material.dart';
import 'package:myapp/routerapp/model/product.dart';
import 'package:myapp/routerapp/routes/product_description.dart';

class ProductHome extends StatelessWidget {
  static const route = "/product";
  @override
  Widget build(BuildContext context) {
    List<Product> products = List.generate(100,
        (index) => Product(name: "Product $index", price: (index + 1) * 25));
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Product name : ${products[index].name}"),
            trailing: Text("Price: ${products[index].price}"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDescription(
                            product: products[index],
                          )));
            },
          );
        },
      ),
    );
  }
}
