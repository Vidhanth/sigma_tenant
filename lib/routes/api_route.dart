import 'package:flutter/material.dart';
import 'package:sigma_tenant/components/spaces_list.dart';

class ApiRoute extends StatelessWidget {
  const ApiRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/db');
        },
        backgroundColor: Colors.pink.shade700,
        child: const Text('DB'),
      ),
      appBar: AppBar(
        title: const Text('Api Route'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SpacesList(),
    );
  }
}
