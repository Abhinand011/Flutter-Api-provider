import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartone.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<ShoppingCart>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cart.items[index]),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cart.removeItem(cart.items[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.addItem('Item ${cart.items.length + 1}');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
