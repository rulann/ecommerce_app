import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo-implement.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class ContantActions {
  static HttpRepo httpRepo = HttpRepoImplement();
  static CacheUtils cacheUtils = CacheUtils(GetStorage());

  static Future<void> login() async {
    HttpRepo httpRepo = HttpRepoImplement();

    final emailController = TextEditingController();
    final pwController = TextEditingController();
    Rx<Response?> res = Rx<Response?>(null);
     res.value = await httpRepo.logIn(
        lang: Get.deviceLocale?.languageCode ?? 'en',
        mail: emailController.text,
        password: pwController.text);

    if (res != null && res.isOk) {
      print('${res}, email: ${emailController.text}, pw: ${pwController.text}');
      if (res.statusCode == 200) {
        // print('login ok');
        var resBody = jsonDecode(res.bodyString!);
        print('resBody: ${resBody}');

        final status = resBody['status'];
        final message = resBody['message'];

        print('status: ${status}');
        if (status == 200) {
          cacheUtils.Login(
              mail: emailController.text,
              uid: resBody['data']['uid'],
              token: resBody['data']['token']);
          print('token: ${resBody['data']['token']}');

          Get.toNamed('/home');
        } else if (status == 401) {
          Get.defaultDialog(
              title: 'user doesn\'t exist please sign up',
              middleText: '',
              onConfirm: () {
                Get.toNamed('/signup');
              },
              onCancel: () {
                Get.back();
              });
        } else if (status == 400) {
          Get.defaultDialog(
              title: 'Invalid username or password',
              middleText: '',
              onConfirm: () {
                Get.back();
              },
              onCancel: () {
                Get.back();
              });
        } else {
          Get.defaultDialog(
              title: '${message}',
              middleText: '',
              onConfirm: () {
                Get.back();
              });
        }
      } else {
        print('error: ${res.statusText} error code: ${res.statusCode}');
      }
    } else {
      print('res isn\'t ok');
    }
  }
}
