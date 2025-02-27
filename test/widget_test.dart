import 'package:flutter_test/flutter_test.dart';

import 'package:chasis/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construir la app y activar un frame.
    await tester.pumpWidget(MyApp(routes: []));
  });
}
