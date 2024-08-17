import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:flutter_application_1/views/widget/my_info_feild_widget.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 70,
        title: const Row(
          children: [
            Icon(Icons.person_outline_rounded),
            SizedBox(
              width: 10,
            ),
            Text(
              'My Information',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
                fontFamily: 'DM san',
                color: Color.fromRGBO(4, 11, 20, 1),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 30, bottom: 10),
          child: Column(
            children: [
              MyInfoFeild(
                label: 'Full Name',
                hint: 'Enter Full Name',
                icon: Icons.person_outline_rounded,
                type: TextInputType.text,
              ),
              MyInfoFeild(
                label: 'Email',
                hint: 'Enter Your Email',
                icon: Icons.email_outlined,
                type: TextInputType.emailAddress,
              ),
              MyInfoFeild(
                label: 'Phone',
                hint: 'Enter Your Phone Number',
                icon: Icons.phone,
                type: TextInputType.phone,
              ),
              MyInfoFeild(
                label: 'Password',
                icon: Icons.password,
                hint: 'Enter the Password',
                type: TextInputType.visiblePassword,
                obscureText: true,
              ),
              Container(
                height: 90,
                width: 300,
                padding: EdgeInsets.only(top: 40),
                margin: EdgeInsets.only(right: 30),
                child: MaterialButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {},
                  color: AppColor.ButtonsColor,
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DM san',
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
