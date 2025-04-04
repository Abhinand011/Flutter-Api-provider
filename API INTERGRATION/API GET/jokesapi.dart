import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Jokesapi extends StatefulWidget {
  const Jokesapi({super.key});

  @override
  State<Jokesapi> createState() => _JokesapiState();
}

class _JokesapiState extends State<Jokesapi> {
  String? displayvalue = '';

  Future jokes() async {
    String? Url = "https://api.chucknorris.io/jokes/random";
    final Response1 = await http.get(Uri.parse(Url));
    final data = json.decode(Response1.body) as Map<String, dynamic>;
    if (Response1.statusCode == 200) {
      setState(() {
        displayvalue = data['value'];
      });
    } else {
      displayvalue = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  jokes();
                },
                child: Text("ok")),
            Text(displayvalue as String),
          ],
        ),
      ),
    );
  }
}
