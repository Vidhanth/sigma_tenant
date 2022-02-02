import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  String _searchText = '';
  String get searchText => _searchText;
  set searchText(newText) {
    _searchText = newText;
    notifyListeners();
  }
}
