import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatelessWidget {
  final Dio _dio = Dio();

  Future<void> login() async {
    final response = await _dio.post("http://localhost:3000/setToken",
        data: {"token": "mock-cognito-token"});
    if (response.statusCode == 200) {
      print("Login exitoso");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: login,
          child: Text("Iniciar Sesión"),
        ),
      ),
    );
  }
}
