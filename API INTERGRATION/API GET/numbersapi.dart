import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Numberss extends StatefulWidget {
  const Numberss({super.key});

  @override
  State<Numberss> createState() => _NumberssState();
}

class _NumberssState extends State<Numberss> {
  var text = "";
  var textt = "";
  TextEditingController num = TextEditingController();

  Future get(num) async {
    String? url = "https://api.chucknorris.io/jokes/random";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body) as Map;
    if (response.statusCode == 200) {
      setState(() {
        text = data['created_at'];
        textt = data["type"];
      });
    } else {
      setState(() {
        text = "ERROr";
        textt="Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ElevatedButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(title: Text("Enter VAlue"),
              content: TextFormField(controller: num,),
              actions: [TextButton(onPressed: () {
               get(num.text);Navigator.pop(context);
              }, child:Text("Ok"))
              ],);
          },);
        }, child: Text("Enter")),Text(text),
          Text(textt)
        ],
      ),
    );
  }
}
