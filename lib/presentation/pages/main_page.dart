import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chasis Principal")),
      body: Center(child: Text("Aquí se renderizan los microfrontends")),
    );
  }
}
