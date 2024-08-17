import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_bindings/app_binding.dart';
import 'package:flutter_application_1/views/pages/cart.dart';
import 'package:flutter_application_1/views/pages/home.dart';
import 'package:flutter_application_1/views/pages/info.dart';
import 'package:flutter_application_1/views/pages/login.dart';
import 'package:flutter_application_1/views/pages/login_with_controller.dart';
import 'package:flutter_application_1/views/pages/myAccount.dart';
import 'package:flutter_application_1/views/pages/order.dart';
import 'package:flutter_application_1/views/pages/product.dart';
import 'package:flutter_application_1/views/pages/signup.dart';
import 'package:flutter_application_1/views/pages/splash.dart';
import 'package:flutter_application_1/views/pages/subCategory.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      home: Splash(),
      getPages: [
        GetPage(name: '/', page: () => Splash()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/loginC', page: () => LoginWithController()),
        GetPage(name: '/signup', page: () => Signup()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/acc', page: () => MyAccount()),
        GetPage(name: '/cart', page: () => Cart()),
        GetPage(name: '/order', page: () => MyOrder()),
        GetPage(name: '/info', page: () => MyInfo()),
        GetPage(name: '/product', page: () => Item()),
        GetPage(name: '/subCategory', page: () => SubCategory())
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
