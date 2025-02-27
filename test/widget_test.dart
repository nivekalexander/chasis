import 'package:flutter_test/flutter_test.dart';
import 'package:chasis/main.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 🔹 Define un router de prueba con una sola ruta básica
    final testRouter = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(body: Text('Página de prueba')),
        ),
      ],
    );

    // Construir la app con el router de prueba
    await tester.pumpWidget(MyApp(router: testRouter));

    // Verifica si el widget se carga correctamente
    expect(find.text('Página de prueba'), findsOneWidget);
  });
}
