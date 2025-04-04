import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'class_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: MaterialApp(
        home: Firstone(),
      )));
}

class Firstone extends StatelessWidget {
  const Firstone({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(
      builder: (context, numbermodel, child) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(
              numbermodel.number.isEmpty
                  ? "The list is empty"
                  : "Item count is ${numbermodel.number.last}",
            ),

            Expanded(
              child: ListView.builder(
                itemCount: numbermodel.number.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('ur number is :${numbermodel.number[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbermodel.listadd();
          },

          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
