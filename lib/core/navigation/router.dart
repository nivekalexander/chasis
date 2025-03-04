import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../microfrontends/microfrontends_config.dart';
import '../../features/microfrontend_loader/microfrontend_loader.dart';

Future<List<GoRoute>> dynamicRoutes = _generateDynamicRoutes();

Future<GoRouter> getRouter() async {
  final routes = await dynamicRoutes;
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      ...routes,
    ],
  );
}

Future<List<GoRoute>> _generateDynamicRoutes() async {
  final microfrontends = await MicrofrontendsConfig.fetchMicrofrontends();
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
