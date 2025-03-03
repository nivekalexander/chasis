import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/api_gateway.dart';
import '../../features/microfrontend_loader/microfrontend_loader.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => FutureBuilder(
        future: ApiGateway.getMicrofrontendToShow(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return ErrorScreen(message: snapshot.error.toString());
          }
          return MicrofrontendLoader(url: snapshot.data ?? '');
        },
      ),
    ),
  ],
);

class ErrorScreen extends StatelessWidget {
  final String message;
  ErrorScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Error: $message", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
