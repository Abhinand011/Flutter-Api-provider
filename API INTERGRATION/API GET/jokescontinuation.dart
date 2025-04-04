import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
void main(){
  runApp(MaterialApp(home:Jokes()));
}
class Jokes extends StatefulWidget {
  const Jokes({super.key});

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  TextEditingController num=TextEditingController();
  var show = '';

  Future jokes(String num) async {
    String? url = "http://numbersapi.com/$num?json";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body) as Map;
    if (response.statusCode == 200) {
      setState(() {
        show = data['text'];
      });
    }
    else {
      setState(() {
        show = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog( content: TextFormField(controller: num),
              actions: [TextButton(onPressed: () {
                jokes(num.text);Navigator.pop(context);
              }, child: Text("Ok"))
              ],
            );
          },);
        }, child: Text("Okkey")),Text(show)
      ],),

    );
  }
}
