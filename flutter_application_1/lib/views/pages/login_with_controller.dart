import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:flutter_application_1/views/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginWithController extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        fontFamily: 'DM san'),
                  ),
                  Container(
                    width: 333,
                    height: 50,
                    margin: EdgeInsets.only(top: 20, bottom: 35),
                    child: const Text(
                      'We represent some of the biggest and leading brand names in the market ',
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 14.91,
                          color: Color.fromRGBO(82, 75, 107, 1),
                          fontFamily: 'DM san'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.76,
                          fontFamily: 'DM san'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 363.45,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
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
                    child: TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(left: 25, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.76,
                          fontFamily: 'DM san'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    width: 363.45,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
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
                    child: Obx(() => TextField(
                          obscureText: controller.IsVisible.value,
                          controller: controller.pwController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.changeVisibility();
                                },
                                icon: controller.visibleIcon.value),
                          ),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                value: controller.remember.value,
                                onChanged: (val) {
                                  controller.check(val);
                                })),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.76,
                                  fontFamily: 'DM san',
                                  color: Color.fromRGBO(170, 166, 185, 1)),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.76,
                                fontFamily: 'DM san'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 57.33,
                    width: 305.01,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: MaterialButton(
                      padding: EdgeInsets.all(12),
                      onPressed: () {
                        controller.login();
                      },
                      color: AppColor.ButtonsColor,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You don\'t have an account yet?'),
                      TextButton(
                        child: Text('Sign up'),
                        onPressed: () {
                          Get.toNamed('/signup');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
