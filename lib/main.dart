import 'package:flutter/material.dart';
import 'package:myapp/widgets/shoppingcart.dart';

void main() => runApp(ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ));
