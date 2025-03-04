import 'package:go_router/go_router.dart';

class RouterBuilder {
  final List<GoRoute> routes;

  RouterBuilder({required this.routes});

  GoRouter buildRouter() {
    return GoRouter(
      routes: routes,
    );
  }
}
