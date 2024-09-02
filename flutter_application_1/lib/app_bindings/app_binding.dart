import 'package:flutter_application_1/constant/locale/locale_controller.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo-implement.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/controller/cart_controller.dart';
import 'package:flutter_application_1/views/controller/home_controller.dart';
import 'package:flutter_application_1/views/controller/login_controller.dart';
import 'package:flutter_application_1/views/controller/product_details_controller.dart';
import 'package:flutter_application_1/views/controller/signup_controller.dart';
import 'package:flutter_application_1/views/controller/sub_category_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    final repo = Get.put<HttpRepo>(HttpRepoImplement(), permanent: true);

    final cacheUtils = Get.put(CacheUtils(GetStorage()), permanent: true);

    Get.create(() => LoginController(httpRepo: repo, cacheUtils: cacheUtils));
    Get.create(() => SignupController(httpRepo: repo, cacheUtils: cacheUtils));
    Get.create(() => HomeController(httpRepo: repo, cacheUtils: cacheUtils));
    Get.create(
        () => ProductDetailsController(httpRepo: repo, cacheUtils: cacheUtils));
    Get.create(
        () => SubCategoryController(httpRepo: repo, cacheUtils: cacheUtils));
    // Get.create(
    //     () => SubProductController(httpRepo: repo, cacheUtils: cacheUtils));
    Get.create(() => CartController(httpRepo: repo, cacheUtils: cacheUtils));
    Get.create(() => LocaleController());
  }
}
