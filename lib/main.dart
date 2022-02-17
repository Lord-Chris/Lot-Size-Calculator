import 'package:flutter/material.dart';
import 'calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lot Size Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const CalculatorScreen(),
    );
  }
}