import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(ChangeNotifierProvider(create:(context) => Number() ,child: const MaterialApp(home: ApiProvider())));
}

class ApiProvider extends StatefulWidget {
  const ApiProvider({super.key});

  @override
  State<ApiProvider> createState() => _ApiProviderState();
}

class _ApiProviderState extends State<ApiProvider> {
TextEditingController num=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Provider Get"),
    ), body: Center(child: Column(children: [ElevatedButton(onPressed: () {
      showDialog(context: context, builder: (context) {
       return AlertDialog(
          title: Text("Enter Number"),
          content: TextField(controller:num,
            decoration: InputDecoration(hintText: "Enter a value"),),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("cancel")),
            TextButton(onPressed: () {
              context.read<Number>().Numbers(num.text);
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
        );
      },);
    },
      child: const Text("Lod"),
      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),),
      Consumer<Number>(builder: (context,Numbers,child){
        return Text("Text : ${Numbers.text}");
      })
    ],)),);
  }
}
class Number extends ChangeNotifier{
  String _text="Hi";
  String get text=> _text;
  Future <void> Numbers (String num)async{
    String url='http://numbersapi.com/$num?json';
    final response=await http.get(Uri.parse(url));
    final data =jsonDecode(response.body) as Map;
    if (response.statusCode==200){
      _text=data['text'];
    }
    else {
      _text="Error";
    }
    notifyListeners();
  }

}