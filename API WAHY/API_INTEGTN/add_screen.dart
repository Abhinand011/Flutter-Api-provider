import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddScreen extends StatefulWidget {
  final Map? todo;

  AddScreen({this.todo});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      isEdit = true;
      titleController.text = widget.todo?['title'] ?? '';
      descriptionController.text = widget.todo?['description'] ?? '';
    }
  }

  Future<void> submit() async {
    final body = {
      'title': titleController.text,
      'description': descriptionController.text,
      'is_completed': false,
    };

    final url = isEdit
        ? 'http://api.nstack.in/v1/todos/${widget.todo?["_id"]}'
        : 'http://api.nstack.in/v1/todos';
    final response = isEdit
        ? await http.put(Uri.parse(url),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'})
        : await http.post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Todo' : 'Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submit,
              child: Text(isEdit ? 'Update' : 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}