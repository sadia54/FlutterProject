import 'package:codepur_practice_a/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double pi = 30.0;
    // bool isFemale = true;
    // num temp = 20.5;

    // var day = "Friday";
    // const pi = 3.4;

    return MaterialApp(
      home: HomePage(),
    );
  }
}
