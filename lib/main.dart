import 'package:flutter/material.dart';
import 'StartingPage.dart';
import 'SignupPage.dart';
import 'OnCard1.dart';
import 'OnCard2.dart';
import 'OnCard3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartingPage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
