import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onChanged;
  const SearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        onChanged.call(newText.trim().toLowerCase());
      },
      decoration: const InputDecoration(
        hintText: 'Search',
      ),
    );
  }
}
