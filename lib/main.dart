import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/services/auth_service.dart';
import 'router/microfrontends_router.dart';

void main() {
  runApp(ChasisApp());
}

class ChasisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: microfrontendsRouter,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
