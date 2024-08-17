import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/login_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final HttpRepo httpRepo;
  final CacheUtils cacheUtils;

  LoginController({
    required this.httpRepo,
    required this.cacheUtils,
  });

  final emailController = TextEditingController();
  final pwController = TextEditingController();

  final key = GlobalKey<FormState>();

  Rx<LogInModel?> loginModel = Rx<LogInModel?>(null);

  RxBool remember = false.obs;
  RxBool IsVisible = true.obs;
  Rx<Icon> visibleIcon =
      Icon(Icons.visibility_off, color: Color.fromRGBO(196, 196, 196, 1)).obs;

  void changeVisibility() {
    if (IsVisible.value) {
      IsVisible.value = false;
      visibleIcon.value =
          Icon(Icons.visibility, color: Color.fromRGBO(196, 196, 196, 1));
    } else {
      IsVisible.value = true;
      visibleIcon.value =
          Icon(Icons.visibility_off, color: Color.fromRGBO(196, 196, 196, 1));
    }
  }

  void check(bool? val) {
    remember.value = val!;
  }

  login() async {
    try {
      late Rx<Response?> LoginRes = Rx<Response?>(null);

      LoginRes.value = await httpRepo.logIn(
          lang: 'en',
          mail: emailController.value.text,
          password: pwController.value.text);

      if (loginModel.value != null) {
        loginModel.value = LogInModel.fromJson(LoginRes.value!.body);

        await cacheUtils.Login(
          mail: loginModel.value?.data.email ?? '',
          uid: loginModel.value?.data.uid ?? '',
          token: loginModel.value?.data.token ?? '',
        );
        print(LoginRes.value?.body);
      }
    } catch (e) {
      Get.defaultDialog(
          title: 'Error dialog',
          middleText: e.toString(),
          onConfirm: () => Get.back());
      print('error:  ${e.toString()} ');
    }
  }
}
