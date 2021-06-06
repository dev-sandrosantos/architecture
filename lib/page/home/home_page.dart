import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  final String text;
  MyHome(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Logado com sucesso! $text'),
      ),
    );
  }
}
