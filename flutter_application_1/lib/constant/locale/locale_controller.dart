import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  void changeLang(String lang) async {
    Locale locale = Locale(lang);
    Get.updateLocale(locale);
   
  }
}
