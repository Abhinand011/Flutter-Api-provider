import 'package:flutter/material.dart';

class ExamplePage2 extends StatefulWidget {
  const ExamplePage2({super.key,required this.name});
  final List<int> name;

  @override
  State<ExamplePage2> createState() => _ExamplePage2State();
}

class _ExamplePage2State extends State<ExamplePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount:widget. name.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text('${widget.name[index]}'),);
              },
            ),
          ),
        ],
      ),
    );
  }
}
