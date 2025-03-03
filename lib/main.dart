import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/navigation/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
