import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foods/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.pinkAccent, primarySwatch: Colors.purple),
      home: SplashScreen(),
    );
  }
}
