import 'package:flutter/material.dart';
import 'package:food_app/screens/loginn.dart';
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
        home: Login(),
    );
  }
}
