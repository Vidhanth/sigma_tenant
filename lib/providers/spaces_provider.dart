import 'package:flutter/material.dart';
import 'package:sigma_tenant/models/space.dart';
import 'package:sigma_tenant/utils/db_helper.dart';
import 'package:sigma_tenant/utils/spaces_client.dart';

class SpacesProvider with ChangeNotifier {
  SpacesProvider() {
    getAllSpaces();
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String newText) {
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
      _spacesList = await SpacesClient.getAllSpaces();
      notifyListeners();
      await saveSpacesToDb();
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveSpacesToDb() async {
    await DBHelper.instance.saveSpaces(_spacesList);
  }
}
