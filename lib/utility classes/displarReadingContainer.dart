import 'package:flutter/material.dart';

Container DisplayReadingContainer(
    {required String readingType,
    required Color color,
    required String boxTitle}) {
  return Container(
    height: 120,
    width: 120,
    alignment: Alignment.center,
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 15.0,
          offset: Offset(5, 5),
        ),
      ],
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(readingType),
        Text(boxTitle),
      ],
    ),
  );
}
