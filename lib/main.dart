import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/services/microfrontend_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<GoRoute> microfrontendsRoutes =
      await MicrofrontendLoader.loadMicrofrontends();

  final router = GoRouter(
    initialLocation: '/home', // Asegura que carga la pantalla inicial
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Bienvenido al Chasis'))),
      ),
      ...microfrontendsRoutes, // 🔹 Agrega dinámicamente las rutas obtenidas del servidor
    ],
  );

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({required this.router, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
