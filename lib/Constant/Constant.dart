import 'package:flutter/material.dart';

void push_screen({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
}

const kloginPageContainerStyle= BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/1.jpg'),
    fit: BoxFit.cover,
  ),
);


const kWelcomeBackTextStyle = TextStyle(color: Colors.white, fontSize:60, fontWeight: FontWeight.w300);

const kFieldTextColor= Color.fromARGB(255, 0, 0, 0);
const kFieldFillColor = Color.fromARGB(75, 255, 255, 255);