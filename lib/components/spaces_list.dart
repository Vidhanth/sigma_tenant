import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_tenant/components/search_bar.dart';
import 'package:sigma_tenant/components/space_item.dart';
import 'package:sigma_tenant/providers/db_provider.dart';
import 'package:sigma_tenant/providers/spaces_provider.dart';

class SpacesList extends StatelessWidget {
  final bool offline;

  const SpacesList({Key? key, this.offline = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        children: [
          SearchBar(
            onChanged: (newText) {
              if (offline) {
                context.read<DbProvider>().searchText = newText;
              } else {
                context.read<SpacesProvider>().searchText = newText;
              }
            },
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: offline
                  ? context.watch<DbProvider>().spacesList.map((space) {
                      return SpaceItem(space: space);
                    }).toList()
                  : context.watch<SpacesProvider>().spacesList.map((space) {
                      return SpaceItem(space: space);
                    }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
