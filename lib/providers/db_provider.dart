import 'package:flutter/material.dart';
import 'package:sigma_tenant/models/space.dart';
import 'package:sigma_tenant/utils/db_helper.dart';

class DbProvider with ChangeNotifier {
  DbProvider() {
    getAllSpaces();
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(newText) {
    _searchText = newText;
    notifyListeners();
  }

  List<Space> _spacesList = [];
  List<Space> get spacesList {
    if (_searchText.isEmpty) {
      return _spacesList;
    } else {
      return _spacesList
          .where((space) =>
              space.description.toLowerCase().contains(_searchText) ||
              space.displayName.toLowerCase().contains(_searchText))
          .toList();
    }
  }

  Future<void> getAllSpaces() async {
    try {
      _spacesList = await DBHelper.instance.loadSpaces();
      notifyListeners();
    } catch (e) {
      print('There was an error loading from database.');
    }
  }
}
