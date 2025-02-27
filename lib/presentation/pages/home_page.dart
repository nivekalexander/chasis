import 'package:flutter/material.dart';
import '../../core/services/auth_service.dart';

class HomePage extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: FutureBuilder<String?>(
        future: authService.getToken(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return Center(
              child: Text("Bienvenido, tu token es: ${snapshot.data}"));
        },
      ),
    );
  }
}
