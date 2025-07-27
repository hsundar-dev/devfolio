import 'package:flutter/material.dart';

class MyTextTheme {
  static const String fontFamily = 'Zain';


  static const TextStyle headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: fontFamily,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontFamily: fontFamily,
  );

  static const TextStyle body = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: fontFamily,
  );

  static const TextStyle normal = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontFamily: fontFamily,
  );
}