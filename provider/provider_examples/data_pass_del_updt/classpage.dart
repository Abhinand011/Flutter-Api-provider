import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
    late String title;

  Task({required this.title});
}

class TaskManage extends ChangeNotifier {
final List<Task> _task=[];
List<Task> get  task=> List.unmodifiable(_task);

void increment(String title){
  _task.add(Task(title:title));
  notifyListeners();
}
void update(String newtitle,int index){
  _task[index].title=newtitle;
  notifyListeners();
}
void delete(int index){
  _task.removeAt(index);
  notifyListeners();
}

}

