import 'package:flutter/material.dart';

void push_screen({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
}

const kloginPageContainerStyle= BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/Cover.jpg'),
    fit: BoxFit.cover,
  ),
);


const kWelcomeBackTextStyle = TextStyle(color: Colors.white, fontSize: 33);

const kFieldTextColor= Color.fromARGB(255, 0, 0, 0);
const kFieldFillColor = Color.fromARGB(120, 255, 255, 255);