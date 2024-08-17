import 'package:flutter/material.dart';

class MyInfoFeild extends StatelessWidget {
  const MyInfoFeild(
      {this.icon,
      required this.label,
      required this.hint,
      required this.type,
      this.obscureText = false});

  final IconData? icon;
  final String label;
  final String hint;
  final TextInputType type;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 15),
              Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13.76,
                    fontFamily: 'DM san'),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xffF3F3F3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  color: Color(0xffF3F3F3),
                  offset: const Offset(0, 0),
                ),
              ]),
          margin: EdgeInsets.only(right: 20, top: 10),
          child: TextField(
            keyboardType: type,
            obscureText: obscureText,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DM san',
                  color: Color.fromRGBO(194, 194, 194, 1)),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
