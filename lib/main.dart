// import 'package:architecture/architecture/mvc/login_page.dart';
import 'package:architecture/architecture/mvp/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Architectures', theme: ThemeData.dark(), home: LoginPageMVP());
  }
}
