import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/signup_model.dart';
import 'package:flutter_application_1/views/pages/login.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  RxString selectedDate = RxString('');
  RxBool IsVisible = RxBool(true);
  Rx<Icon> visibleIcon =
      Icon(Icons.visibility_off, color: Color.fromRGBO(196, 196, 196, 1)).obs;
  Rx<SignUpModel?> signUpModel = Rx<SignUpModel?>(null);

  final HttpRepo httpRepo;
  final CacheUtils cacheUtils;

  SignupController({
    required this.httpRepo,
    required this.cacheUtils,
  });

  final emailController = TextEditingController();
  final pwController = TextEditingController();
  //final pwConfirmController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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

  Signup() async {
    try {
      late Rx<Response?> SignUpRes = Rx<Response?>(null);

      SignUpRes.value = await httpRepo.signUp(
          lang: 'en',
          mail: emailController.value.text,
          password: pwController.value.text,
          phone_number: phoneController.value.text,
          birth_date: dateController.value.text);
      if (SignUpRes.value == null) {
        return;
      }

      if (signUpModel.value != null) {
        signUpModel.value = SignUpModel.fromJson(SignUpRes.value!.body);

        await cacheUtils.Login(
            mail: signUpModel.value!.data.email,
            uid: signUpModel.value!.data.uid,
            token: signUpModel.value!.data.token);
        Get.offAll(() => Login());
      }
    } catch (e) {
      Get.defaultDialog(
          title: 'Error ',
          middleText: e.toString(),
          onConfirm: () => Get.back());
      print(e.toString());
    }
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      selectedDate.value = formattedDate;
      dateController.text = formattedDate;
    }
  }
}
