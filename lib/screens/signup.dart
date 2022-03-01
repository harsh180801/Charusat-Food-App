import 'package:flutter/material.dart';
import 'package:food_app/screens/loginn.dart';
import 'package:food_app/widget/gender.dart';
import 'package:food_app/widget/haveaccountornot.dart';
import 'package:food_app/widget/mybutton.dart';
import 'package:food_app/widget/mypasswordtextformField.dart';
import 'package:food_app/widget/mytextformfield.dart';
import 'package:food_app/widget/toptitle.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  void validation() {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullName.text.isEmpty &&
        address.text.isEmpty &&
        phoneNumber.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("All Field are Empty")));
    }
    else if (fullName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("FullName is empty")),
      );
    }
    else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email is not valid")),
      );
    }
    else if (phoneNumber.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone Number is empty")),
      );
    }
    else if (phoneNumber.text.length < 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone Number must be 10 digits")),
      );
    }
    else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password is empty")),
      );
    }
    else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password is too short")),
      );
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //resizeToAvoidBottomInset: false,
      key: scaffold,
      backgroundColor: const Color(0xff122547),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TopTitle(
                subsTitle: "Create an Account",
                title: "SignUp",
              ),
              Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTextFormField(
                      controller: fullName,
                      title: "Full Name",
                    ),
                    MyTextFormField(
                      controller: email,
                      title: "Email",
                    ),
                    MyTextFormField(
                      controller: phoneNumber,
                      title: "Phone NUmber",
                    ),
                    MyTextFormField(
                      controller: address,
                      title: "Address",
                    ),
                    Gender(),
                    MyPasswordTextFormField(
                      controller: password,
                      title: "Password",
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
              ),
              MyButton(
                  name: "Sign Up",
                  onPressed: () {
                validation();
              }),
              Container(
                height: 20,
              ),
              HaveAccountOrNot(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Login(),
                  ),
                  );
                },
                  title: "I already have an account  ", subTitle: "Login"),
            ],
          ),
        ),
      ),
    );
  }
}
