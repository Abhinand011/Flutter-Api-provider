import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JokesApii(),
  ));
}

class JokesApii extends StatefulWidget {
  const JokesApii({super.key});

  @override
  State<JokesApii> createState() => _JokesApiiState();
}

class _JokesApiiState extends State<JokesApii> {
  Future<joke> apijoke() async {
    String Url = 'https://api.chucknorris.io/jokes/random';
    http.Response resp = await http.get(Uri.parse(Url));
    if (resp.statusCode == 200) {
      return joke.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  void ChangeJoke() {
    setState(() {
      build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(child: FutureBuilder(future: apijoke(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return Text(snapshot.data!.name);
            }
            else if (snapshot.hasError){
              return Text("Snapshot Error :${snapshot.error}");
            }
            return CircularProgressIndicator();
          },)),
          Center(
            child: ElevatedButton(
              onPressed: () {ChangeJoke();},
              child: Text(
                "Load Jokes",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class joke {
  String name;
  String id;

  joke.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['value'];
}
