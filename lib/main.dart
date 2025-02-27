import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chasis/services/microfrontend_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final microfrontends = await MicrofrontendLoader.loadMicrofrontends();

  runApp(MyApp(routes: microfrontends));
}

class MyApp extends StatelessWidget {
  final List<GoRoute> routes;

  const MyApp({required this.routes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: routes,
      ),
    );
  }
}
