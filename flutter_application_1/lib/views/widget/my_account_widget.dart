import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_color.dart';

class MyAccountWidget extends StatelessWidget {
  final Widget? leading;
  final Widget? text;
  final Function()? tap;
  const MyAccountWidget({super.key, this.leading, this.text, this.tap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      width: 350,
      height: 60,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: AppColor.ShadowColor,
          offset: const Offset(0, 0),
          blurRadius: 10,
        ),
        BoxShadow(
          color: Colors.white,
          offset: const Offset(-4, -4),
        )
      ]),
      child: ListTile(
        title: text,
        leading: leading,
        trailing: Icon(Icons.navigate_next_outlined),
        onTap: tap,
      ),
    );
  }
}
