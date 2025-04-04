import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => Home(),
    child: MaterialApp(home: Homepage()),
  ));
}

class Home extends ChangeNotifier {
  List<String> _names = [];

  List<String> get names => _names;

  void add(String name) {
    _names.add(name);
    notifyListeners();
  }

  void edit(int index, String newName) {
    _names[index] = newName;
    notifyListeners();
  }

  void delete(int index) {
    _names.removeAt(index);
    notifyListeners();
  }
}

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final TextEditingController names = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: names,
            decoration: InputDecoration(hintText: "Enter"),
          ),
          ElevatedButton(
            onPressed: () {
              if (names.text.isNotEmpty) {
                context.read<Home>().add(names.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Secondpage(),
                  ),
                );
              }
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    final names = context.watch<Home>().names;

    return Scaffold(
      appBar: AppBar(title: Text("Saved Names")),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(names[index][0].toUpperCase()), // First letter as avatar
            ),
            title: Text(names[index]),
            trailing: PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == "Edit") {
                  // Example edit action
                  _showEditDialog(context, index, names[index]);
                }
                if (value == "Delete") {
                  context.read<Home>().delete(index);
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem<String>(
                    value: 'Edit',
                    child: Text("Edit"),
                  ),
                  PopupMenuItem<String>(
                    value: 'Delete',
                    child: Text("Delete"),
                  ),
                ];
              },
            ),
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index, String currentName) {
    final TextEditingController editController =
    TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Name"),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(hintText: "Enter new name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<Home>().edit(index, editController.text);
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
