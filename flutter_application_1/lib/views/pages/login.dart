import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo-implement.dart';
import 'package:flutter_application_1/views/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Login extends StatelessWidget {
  HttpRepoImplement httpRepo = Get.put(HttpRepoImplement());
  CacheUtils cacheUtils = CacheUtils(GetStorage());

  String email = '';
  String pw = '';

  Future<Response?> logIn(String mail, String password) async {
    final res = await httpRepo.logIn(lang: 'en', mail: email, password: pw);

    if (res != null) {
      print('${res}, email: ${mail}, pw: ${password}');

      if (res.isOk) {
        if (res.statusCode == 200) {
          print('login ok');
          var resBody = jsonDecode(res.bodyString!);
          print(resBody);

          if (resBody['data']['token'] != null) {
            cacheUtils.Login(
                mail: email,
                uid: resBody['data']['uid'],
                token: resBody['data']['token']);
          } else {
            print('token is null');
          }
        } else {
          print('status code: ${res.statusCode}');
        }
      } else {
        print('error: ${res.statusText}');
      }
    } else {
      print('error: Response is null');
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    Future<Response?> loginFuture = logIn(email, pw);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                    onChanged: (value) {
                      email = value;
                    },
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
                    child: GetBuilder<LoginController>(
                      builder: (controller) => TextField(
                        onChanged: (value) {
                          pw = value;
                        },
                        obscureText: controller.IsVisible.value,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.changeVisibility();
                                },
                                icon: controller.visibleIcon.value)),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<LoginController>(
                        builder: (controller) => Row(
                          children: [
                            Checkbox(
                                value: controller.remember.value,
                                onChanged: (val) {
                                  controller.check(val);
                                }),
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
                      loginFuture = logIn(email, pw);
                      (context as Element).markNeedsBuild();
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
                FutureBuilder<Response?>(
                  future: loginFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final res = snapshot.data;
                      if (res != null && res.isOk && res.statusCode == 200) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.toNamed('/home');
                        });
                      } else {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.toNamed('/signup');
                        });
                      }
                      return SizedBox.shrink();
                    }
                    return SizedBox.shrink();
                  },
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
    );
  }
}
