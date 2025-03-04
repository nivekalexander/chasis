import 'package:flutter/material.dart';
import 'core/microfrontends/microfrontends_config.dart';
import 'core/navigation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MicrofrontendsConfig
      .fetchMicrofrontends(); // Carga el JSON antes de iniciar la app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router, // Usa el GoRouter corregido
    );
  }
}
