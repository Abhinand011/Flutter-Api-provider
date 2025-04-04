
import 'package:flutter/cupertino.dart';

class ShoppingCart extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners(); // Notify listeners when an item is added
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners(); // Notify listeners when an item is removed
  }
}
