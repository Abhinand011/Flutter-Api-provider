import 'package:amazon_clone/SET_STATE/example_page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Example(),));
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  List <int>numbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numbers.add((numbers.length + 1));
          });
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: numbers.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text('${numbers[index]}'),);
              },
            ),
          ), TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>ExamplePage2(name: numbers)));
          }, child: Text("Confirm"))
        ],
      ),
    );
  }
}
