import 'package:flutter/material.dart';

void push_screen({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
}
