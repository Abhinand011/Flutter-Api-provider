import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MaterialApp(home: Apigett(),));
}

class User {
  final String id;
  final String first_name;
  final String last_name;
  final String email;
  final String avatar;

  User(
      {required this.id,
        required this.email,
        required this.first_name,
        required this.last_name,
        required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar']);
  }

  String toString() {
    return 'User(id:$id,first_name:$first_name,last_name:$last_name,email:$email,avatar:$avatar)';
  }
}

class Apigett extends StatelessWidget {
  const Apigett({super.key});

  Future<List<User>> getReq() async {
    String url = 'https://reqres.in/api/users?page=1';
    final response = await http.get(Uri.parse(url));
    final response1 = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      List<dynamic> Userdata = response1['data'];
      print("$Userdata");
      return Userdata.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: FutureBuilder(
        future: getReq(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(child: CircularProgressIndicator());
          } else { print("$snapshot.data");
          List<User> nameuser = snapshot.data!;
          print("$nameuser");
          return ListView.builder(
            itemCount: nameuser.length,
            itemBuilder: (context, index) {
              User user = nameuser[index];
              return Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    Column(
                      children: [
                        Text(user.id as String),
                        Text(user.first_name),
                        Text(user.last_name),
                        Text(user.email)
                      ],
                    )
                  ],
                ),
              );
            },
          );
          }

        },
      ),
    );
  }
}