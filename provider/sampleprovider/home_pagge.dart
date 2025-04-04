import 'package:flutter/widgets.dart';

class User{
  String name;
  String email;
  User({required this.name,required this.email});
}

class Userprovider extends ChangeNotifier{
  final List<User> _list=[];
  List<User> get list => _list;
  void add(String names,String emaill){
   _list.add(User(name: names, email: emaill));
  }

}