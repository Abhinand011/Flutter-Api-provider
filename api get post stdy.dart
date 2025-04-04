import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: GetApi(),
  ));
}

class GetApi extends StatefulWidget {
  const GetApi({super.key});

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  TextEditingController num = TextEditingController();
  String show = "";

  Future get(String num) async {
    String? url = "http://numbersapi.com/$num?json";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body) as Map;
    if (response.statusCode == 200) {
      setState(() {
        show = data['text'];
      });
    } else {
      show = "error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: TextFormField(
                      controller: num,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            get(num.text);
                            Navigator.pop(context);
                          },
                          child: Text("Ok"))
                    ],
                  );
                },
              );
            },
            child: Text("Select number"),
          ),
          Text(show),
        ],
      ),
    );
  }
}
