import 'package:flutter/material.dart';
import 'package:suraksha/ContactUs.dart';
import 'package:suraksha/HomePage.dart';
import 'package:suraksha/login.dart';
import 'StartingPage.dart';
import 'OnCard1.dart';
import 'OnCard2.dart';
import 'OnCard3.dart';
import 'HomePage.dart';

void main() {
  runApp(Suraksha());
}

class Suraksha extends StatelessWidget {
  const Suraksha({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLogin(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
