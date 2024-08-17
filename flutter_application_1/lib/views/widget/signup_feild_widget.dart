import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_color.dart';


class Feild extends StatelessWidget {
  Feild(
      {required this.padding,
      this.margin,
      this.height,
      this.width,
      this.type,
      this.obscureText = false,
      this.icon,
       this.changed,
      this.tap, 
      this.controller});

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final TextInputType? type;
  final bool obscureText;
  final IconButton? icon;
  final Function(String)? changed;
  final void Function()? tap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(left: 10, bottom: 15, top: 5),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            color: AppColor.ShadowColor,
            offset: const Offset(0, 0),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.white,
            offset: const Offset(-1, -1),
          )
        ]),
        width: width,
        height: height,
        child: TextField(
          onChanged: changed,
          onTap: tap,
          controller: controller,
          obscureText: obscureText,
          keyboardType: type,
          style: TextStyle(color: Colors.black),
          decoration:
              InputDecoration(border: InputBorder.none, suffixIcon: icon),
        ),
      ),
    );
  }
}
