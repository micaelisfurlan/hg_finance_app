import 'package:flutter/material.dart';
import 'package:hg_finance_app/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainScreen(),
    );
  }
}
