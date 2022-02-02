import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_tenant/providers/db_provider.dart';
import 'package:sigma_tenant/providers/spaces_provider.dart';
import 'package:sigma_tenant/routes/api_route.dart';
import 'package:sigma_tenant/routes/db_route.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SpacesProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DbProvider(),
      ),
    ],
    child: const SigmaTenantApp(),
  ));
}

class SigmaTenantApp extends StatelessWidget {
  const SigmaTenantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          }),
          colorScheme: ColorScheme.light(
              primary: Colors.pink.shade700,
              secondary: Colors.pink.shade700,
              onSecondary: Colors.white)),
      initialRoute: '/',
      routes: {
        '/': (context) => const ApiRoute(),
        '/db': (context) => const DbRoute(),
      },
    );
  }
}
