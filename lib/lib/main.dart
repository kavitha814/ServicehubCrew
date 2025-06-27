import 'package:flutter/material.dart';
import 'package:servicehub/contact_setup.dart';
import 'package:servicehub/language.dart';
import 'package:servicehub/signup.dart';
import 'package:servicehub/repair.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: LanguageSelectionScreen(),
    );
  }
}