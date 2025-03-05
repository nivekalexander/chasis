import 'package:flutter/material.dart';

class ChasisLayout extends StatelessWidget {
  final Widget child;

  const ChasisLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chasis"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(child: child), // Aquí se carga el microfrontend
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
