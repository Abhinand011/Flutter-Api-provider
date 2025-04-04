import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Userprovider(),
    child: MaterialApp(
      home: HomePagee(),
    ),
  ));
}

class HomePagee extends StatelessWidget {
  HomePagee({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<Userprovider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("User Management")),
      body: ListView.builder(
        itemCount: userprovider.list.length,
        itemBuilder: (context, index) {
          final user = userprovider.list[index];
          return ListTile(
            leading: Text(user.name),
            title: Text(user.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editUser(context, userprovider, user, index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    userprovider.delete(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => adduser(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

void adduser(BuildContext context) {
  TextEditingController names = TextEditingController();
  TextEditingController emails = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: names,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              controller: emails,
              decoration: InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Provider.of<Userprovider>(context, listen: false)
                  .add(names.text, emails.text);
              Navigator.pop(context); // Close the dialog after saving
            },
            child: Text("Save"),
          ),
        ],
      );
    },
  );
}

void _editUser(BuildContext context, Userprovider userprovider, User user, int index) {
  final TextEditingController names = TextEditingController(text: user.name);
  final TextEditingController emails = TextEditingController(text: user.email);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Edit User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: names,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              controller: emails,
              decoration: InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              userprovider.edit(index, names.text, emails.text);
              Navigator.pop(context); // Close the dialog after saving
            },
            child: Text("Save"),
          ),
        ],
      );
    },
  );
}

// User Model
class User {
  String name;
  String email;

  User({required this.name, required this.email});
}

// Userprovider with ChangeNotifier
class Userprovider extends ChangeNotifier {
  final List<User> _list = [];

  List<User> get list => _list;

  void add(String name, String email) {
    _list.add(User(name: name, email: email));
    notifyListeners();
  }

  void edit(int index, String name, String email) {
    _list[index] = User(name: name, email: email);
    notifyListeners();
  }

  void delete(int index) {
    _list.removeAt(index);
    notifyListeners();
  }
}
