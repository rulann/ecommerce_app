import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset(
                  'assets/images/image.png',
                  width: 302.15,
                  height: 97.15,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 140),
                child: Text(
                  'Welcome to Yousef Bashiti Stores !',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      fontFamily: 'DM san'),
                ),
              ),
              Container(
                width: 340,
                height: 60,
                margin: EdgeInsets.only(top: 20, bottom: 25),
                child: const Text(
                    'You can contact us at any time when you want a unique experience in browsign the products',
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14.91,
                        color: Color.fromARGB(90, 23, 23, 23),
                        fontFamily: 'DM san')),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: MaterialButton(
                  padding: EdgeInsets.all(12),
                  onPressed: () {
                    Get.toNamed('/loginC');
                  },
                  color: AppColor.ButtonsColor,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GET STARTED',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
