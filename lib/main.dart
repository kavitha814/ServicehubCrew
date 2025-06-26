import 'package:flutter/material.dart';
import 'package:servicehub/signup.dart';
 // Import SignUpScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: SignUpScreen(), // Directly show SignUpScreen
    );
  }
}