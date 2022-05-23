import 'package:codepur_practice_a/utis/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // child: Center(
      //   child: Text("Loging Page",
      //   style: TextStyle(
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.blue
      //   ),
      //   // textScaleFactor: 2.0,
      //   ),
      //    color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter username", labelText: "Username"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  }),
                  child: Text(
                    "Login",
                  ),
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
