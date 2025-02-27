import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/services/auth_service.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';

final AuthService _authService = AuthService();

final GoRouter microfrontendsRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => FutureBuilder<bool>(
        future: _authService.isAuthenticated(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return snapshot.data == true ? HomePage() : LoginPage();
        },
      ),
    ),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
  ],
);
