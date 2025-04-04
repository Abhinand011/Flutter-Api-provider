import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_screen.dart';


void main(){
  runApp(MaterialApp(home:Homepage()));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    setState(() {
      isLoading = true;
    });

    final url = 'http://api.nstack.in/v1/todos?page=1&limit=10';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['items'] as List;
      setState(() {
        items = data;
      });
    } else {
      print('Error fetching data');
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> delete(String id) async {
    final url = 'http://api.nstack.in/v1/todos/$id';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        items = items.where((item) => item['_id'] != id).toList();
      });
    } else {
      print('Error deleting item');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homepage')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
          if (result == true) {
            fetch();
          }
        },
        child: Icon(Icons.add),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item['title']),
            subtitle: Text(item['description']),
            trailing: PopupMenuButton(
              onSelected: (value) {
                if (value == 'Edit') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddScreen(todo: item),
                    ),
                  ).then((value) {
                    if (value == true) fetch();
                  });
                } else {
                  delete(item['_id']);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 'Edit', child: Text('Edit')),
                PopupMenuItem(value: 'Delete', child: Text('Delete')),
              ],
            ),
          );
        },
      ),
    );
  }
}
