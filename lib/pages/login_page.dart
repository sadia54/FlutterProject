import 'package:codepur_practice_a/utis/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

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
              "Welcome $name",
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
                  onChanged: ((value) {
                    name = value;
                    setState(() {});
                  }),
                  decoration: InputDecoration(
                      hintText: "Enter username", labelText: "Username"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password"),
                ),
                SizedBox(
                  height: 40.0,
                ),

                InkWell(
                  onTap: (() async {
                    setState(() {
                      changedButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  }),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changedButton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: changedButton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // shape: changedButton ? BoxShape.circle : BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.circular(changedButton ? 50 : 8)),
                  ),
                )

                // ElevatedButton(
                //   onPressed: (() {
                //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                //   }),
                //   child: Text(
                //     "Login",
                //   ),
                //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
