import 'package:flutter/material.dart';
import 'package:weight_tracker_app/authentication.dart';
import 'package:weight_tracker_app/main.dart';
import 'package:weight_tracker_app/weight_entry.dart';
// ignore_for_file: prefer_const_constructors

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        Container(
          width: w,
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome to Weight tracker',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFFE53935)),
            ),
            Text(
              'Sign_in to Continue',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color.fromARGB(255, 45, 22, 247)),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Username',
                  hintText: 'Enter Your Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Password',
                  hintText: 'Enter Your Password'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                AuthController.instance.signIn(
                    emailController.text.trim(), passwordController.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WeightEntry()));
              },
              child: Text(
                'Sign_in',
                style: const TextStyle(fontSize: 20),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
