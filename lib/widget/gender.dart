import 'package:flutter/material.dart';

class Gender extends StatefulWidget {

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isMale = !isMale;
        });
      },
      child: Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child:  Text(
          isMale == false ? "Female" : "Male",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xfff5d8e4),
            borderRadius:  BorderRadius.circular(10)
        ),
      ),
    );
  }
}
