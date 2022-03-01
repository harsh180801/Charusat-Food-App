import 'package:flutter/material.dart';
import 'package:food_app/screens/signup.dart';
import 'package:food_app/widget/haveaccountornot.dart';
import 'package:food_app/widget/mybutton.dart';
import 'package:food_app/widget/mypasswordtextformField.dart';
import 'package:food_app/widget/mytextformfield.dart';
import 'package:food_app/widget/toptitle.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();

  static String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  void validation() {
    if (email.text.isEmpty && password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Both Field are Empty")
          )
      );
    }
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email is empty")
        ),
      );
    }
    else if(!regExp.hasMatch(email.text)){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email is not valid")
        ),
      );
    }
    else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password is empty")
        ),
      );
    }
    else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password is too short")
        ),
      );
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: const Color(0xff122547),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            reverse: true,
            // padding: EdgeInsets.all(32),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const TopTitle(
                  subsTitle: "Welcome Back!",
                  title: "Login",
                ),
                Center(
                  child: Container(
                      height: 300,
                      width: double.infinity,
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyTextFormField(
                              title: "Email",
                              controller: email,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyPasswordTextFormField(
                            controller: password,
                            title: "Password",
                          ),
                        ],
                      )),
                ),
                MyButton(
                  name: "Login",
                  onPressed: (){
                    validation();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                HaveAccountOrNot(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Signup(),
                      ),
                      );
                    },
                  subTitle: "Sign Up",
                  title: "Don't have an account?  "
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
