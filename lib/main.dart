import 'package:flutter/material.dart';
import 'package:food_app/screens/loginn.dart';
import 'package:food_app/screens/signup.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pinkAccent,
        ),
        home: Signup(),
    );
  }
}
