import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(Duration(seconds: 3));

    final cacheUtils = CacheUtils(GetStorage());

    if (cacheUtils.isLoggedIn()) {
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/signup');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("flutter_application_1/assets/images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
