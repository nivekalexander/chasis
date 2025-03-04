import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../microfrontends/microfrontends_config.dart';
import '../../features/microfrontend_loader/microfrontend_loader.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text("Bienvenido a Chasis")),
        ),
      ),
      ..._generateDynamicRoutes(),
    ],
  );

  static List<GoRoute> _generateDynamicRoutes() {
    final microfrontends = MicrofrontendsConfig.microfrontends;
    return microfrontends.map((micro) {
      return GoRoute(
        path: "/${micro['name']}",
        builder: (context, state) => MicrofrontendLoader(
          url: micro['url'] ?? '',
          microName: micro['name'] ?? '',
        ),
      );
    }).toList();
  }
}
