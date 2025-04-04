import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: PostApii(),
  ));
}

class PostApii extends StatefulWidget {
  const PostApii({super.key});

  @override
  State<PostApii> createState() => _PostApiiState();
}

class _PostApiiState extends State<PostApii> {
  TextEditingController name = TextEditingController();
  TextEditingController names = TextEditingController();
  String one = 'will show';
  String two = 'will show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post API",)),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 150,right: 150),
            child: TextField(
              controller: name,
              decoration: InputDecoration(hintText: "Enter "),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 150,right: 150),
            child: TextField(
              controller: names,
              decoration: InputDecoration(hintText: "Enetr"),
            ),
          ),SizedBox(height: 30,),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  one = name.text;
                  two = names.text;
                  name.clear();
                  names.clear();
                });
              },
              child: Text("Save")),
          Text(one),
          Text(two)
        ],
      ),
    );
  }
}
