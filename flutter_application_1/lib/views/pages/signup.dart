import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:flutter_application_1/views/controller/signup_controller.dart';
import 'package:flutter_application_1/views/widget/signup_feild_widget.dart';
import 'package:get/get.dart';

class Signup extends GetWidget<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create an Account',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          fontFamily: 'DM san'),
                    ),
                    Container(
                      width: 333,
                      height: 50,
                      margin: EdgeInsets.only(top: 20, bottom: 30),
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
                      margin: EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.76,
                            fontFamily: 'DM san'),
                      ),
                    ),
                    Feild(
                      padding: const EdgeInsets.only(bottom: 20),
                      width: 363.45,
                      height: 57,
                      type: TextInputType.emailAddress,
                      controller: controller.emailController,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.76,
                            fontFamily: 'DM san'),
                      ),
                    ),
                    Obx(() => Feild(
                          padding: const EdgeInsets.only(bottom: 20),
                          width: 363.45,
                          height: 57,
                          obscureText: controller.IsVisible.value,
                          controller: controller.pwController,
                          icon: IconButton(
                              onPressed: () {
                                controller.changeVisibility();
                              },
                              icon: controller.visibleIcon.value),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.76,
                            fontFamily: 'DM san'),
                      ),
                    ),
                    Obx(() => Feild(
                          padding: const EdgeInsets.only(bottom: 20),
                          width: 363.45,
                          height: 57,
                          obscureText: controller.IsVisible.value,
                          //controller: controller.pwConfirmController,
                          icon: IconButton(
                            icon: controller.visibleIcon.value,
                            onPressed: () {
                              controller.changeVisibility();
                            },
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Phone Number',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.76,
                            fontFamily: 'DM san'),
                      ),
                    ),
                    Feild(
                      padding: const EdgeInsets.only(bottom: 20),
                      type: TextInputType.phone,
                      width: 363.45,
                      height: 57,
                      controller: controller.phoneController,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Birth Date',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.76,
                            fontFamily: ' '),
                      ),
                    ),
                    Feild(
                      padding: const EdgeInsets.only(bottom: 20),
                      //type: TextInputType.datetime,
                      width: 363.45,
                      height: 57,
                      icon: IconButton(
                        icon: Icon(
                          Icons.calendar_month,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                        onPressed: () {
                          controller.pickDate(context);
                        },
                      ),
                      tap: () {
                        controller.pickDate(context);
                      },
                      changed: (value) {
                        controller.selectedDate.value;
                      },
                      controller: controller.dateController,
                    ),
                    Container(
                      height: 50.33,
                      width: 305.01,
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: MaterialButton(
                        padding: EdgeInsets.all(12),
                        onPressed: () {
                          controller.Signup();
                        },
                        color: AppColor.ButtonsColor,
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'DM san',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.06),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
