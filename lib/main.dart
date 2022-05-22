import 'package:codepur_practice_a/pages/home_page.dart';
import 'package:codepur_practice_a/pages/login_page.dart';
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
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark
      // ),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/loginpage": (context) => LoginPage()
      },
    );
  }
}
