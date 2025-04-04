import 'package:amazon_clone/provider/provider_examples/data_pass_del_updt/classpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskmanager = Provider.of<TaskManage>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: taskmanager.task.length,
                  itemBuilder: (context, index) {
                    final taskk = taskmanager.task[index];
                    return ListTile(
                      title: Text(taskk.title),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Alertedit(context, taskmanager, index);
                              },
                              icon: Icon(Icons.edit)),
                        ],
                      ),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  AddDia(context, taskmanager);
                },
                child: Text("Add task"))
          ],
        ));
  }
}

void AddDia(BuildContext context, TaskManage taskmanager) {
  final TextEditingController name = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add Task"),
        content: TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Add details",
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel")),
          TextButton(
              onPressed: () {
                if (name.text.isNotEmpty) {
                  taskmanager.increment(name.text);Navigator.pop(context);
                }
              },
              child: Text("Save"))
        ],
      );
    },
  );
}

void Alertedit(BuildContext context, TaskManage taskmanager, int index) {
  final TextEditingController newname =
      TextEditingController(text: taskmanager.task[index].title);
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Edit task"),
        content: TextField(
          controller: newname,
          decoration: InputDecoration(hintText: "Editname"),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("cancel")),
          TextButton(
              onPressed: () {
                if (newname.text.isNotEmpty) {
                  taskmanager.update(newname.text, index);
                  Navigator.pop(context);
                }
              },
              child: Text("Save"))
        ],
      );
    },
  );
}
