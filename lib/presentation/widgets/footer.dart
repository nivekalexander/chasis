import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey,
      child: Text(
        "Footer - Chasis",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
