import 'package:codepur_practice_a/pages/cart_page.dart';
import 'package:codepur_practice_a/pages/home_page.dart';
import 'package:codepur_practice_a/pages/login_page.dart';
import 'package:codepur_practice_a/utis/routes.dart';
import 'package:codepur_practice_a/widgets/themes.dart';
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
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),

      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
