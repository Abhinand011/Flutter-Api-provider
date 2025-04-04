import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{
  List<int> number=[0,1];
  //List get list=>number;
  void listadd(){
    number.add(number.last+1);
    notifyListeners();
  }
}