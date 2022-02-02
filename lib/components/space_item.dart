import 'package:flutter/material.dart';
import 'package:sigma_tenant/models/space.dart';

class SpaceItem extends StatelessWidget {
  final Space space;
  const SpaceItem({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  space.displayName.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              space.meta,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              space.description,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Spaces',
              style: TextStyle(color: Colors.pink.shade800, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
