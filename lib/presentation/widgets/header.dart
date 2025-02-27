import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue,
      child: Text(
        "Header - Chasis",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
