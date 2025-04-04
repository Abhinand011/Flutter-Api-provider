import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'class_page.dart';
void main(){
  runApp(ChangeNotifierProvider(create: (context) => ListProvider(),
  child: MaterialApp(home: CartPage(),)));
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(builder: (context,numbers,child)=>
       Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount: numbers.number.length,
                itemBuilder: (context, index) {
                  return ListTile(leading:Text('${numbers.number[index]}'),);
                },
              ),
            ),ElevatedButton(onPressed: (){
              numbers.listadd();
            }, child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
