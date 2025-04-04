
import 'package:flutter/cupertino.dart';
class Name{
  String name;
  Name({required this.name});
}

class Home extends ChangeNotifier{
  final List<Name> _count=[];
  List get count=>_count;
  void add(String Studentname){
    _count.add(Name(name: Studentname));
    notifyListeners();
  }
  void delete(int index){
    _count.remove(index);
    notifyListeners();
  }
  void update(int index,String newname){
    _count[index].name=newname;
    notifyListeners();
  }
}