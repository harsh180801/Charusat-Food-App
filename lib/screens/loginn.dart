import 'package:flutter/material.dart';
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
  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: const Color(0xff122547),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            reverse: false,
            // padding: EdgeInsets.all(32),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const TopTitle(
                  subsTitle: "Welcome Back!",
                  title: "Login",
                ),
                // Container(
                //     height: 200,
                //     width: 500,
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 30, horizontal: 15),
                //     // color: Colors.blue,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "LOGIN",
                //           style: TextStyle(
                //             fontSize: 40,
                //             color: Theme.of(context).primaryColor,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         Text(
                //           "Welcome Back!",
                //           style: TextStyle(
                //             fontSize: 30,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         )
                //       ],
                //     )
                // ),
                Center(
                  child: Container(
                      height: 300,
                      width: 375,
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyTextFormField(
                              title: "Email",
                              controller: email,
                          ),
                          // TextFormField(
                          //   controller: email,
                          //   decoration: InputDecoration(
                          //       fillColor: const Color(0xfff5d8e4),
                          //       filled: true,
                          //       hintText: "Email",
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //         borderSide: BorderSide.none,
                          //       )),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyPasswordTextFormField(
                            controller: password,
                            title: "Password",
                          ),
                          // TextFormField(
                          //   controller: password,
                          //   obscureText: true,
                          //   decoration: InputDecoration(
                          //       fillColor: const Color(0xfff5d8e4),
                          //       filled: true,
                          //       hintText: "Password",
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //         borderSide: BorderSide.none,
                          //       )),
                          // ),
                        ],
                      )),
                ),
                Container(
                  height: 60,
                  width: 375,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    onPressed: () {
                      void validation() {
                        if (email.text.isEmpty && password.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Both Field is Empty")
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
                      };

                      validation();
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an Account? ",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
