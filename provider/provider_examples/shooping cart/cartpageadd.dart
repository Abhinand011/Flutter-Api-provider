import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart2.dart';
import 'cartone.dart';
import 'foundation.dart';
import 'shopping_cart_screen.dart'; // Use relative path if applicable


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShoppingCart(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCartScreen(),
    );
  }
}


