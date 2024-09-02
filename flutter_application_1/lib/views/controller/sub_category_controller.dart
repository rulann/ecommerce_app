import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/subCategory_model.dart';
import 'package:flutter_application_1/views/models/sub_products_model.dart';
import 'package:get/get.dart';

class SubCategoryController extends GetxController {
  late final HttpRepo httpRepo;
  late final CacheUtils cacheUtils;

  SubCategoryController({required this.httpRepo, required this.cacheUtils});

  Rx<SubCategoryModel?> subModel = Rx<SubCategoryModel?>(null);
  Rx<SubProductsModel?> subProductModel = Rx<SubProductsModel?>(null);

  subCate() async {
    try {
      late Rx<Response?> subRes = Rx<Response?>(null);
      subRes.value = await httpRepo.subCategory(
        lang: cacheUtils.getLang(),
        uid: cacheUtils.getUid(),
        token: cacheUtils.getToken(),
        category: cacheUtils.getCategory(),
        limitC: 10,
        offsetC: 0,
        limitP: 20,
        offsetP: 0,
      );

      if (subRes.value == null) {
        print('sub res = null');
        return;
      }

      subModel.value = SubCategoryModel.fromJson(subRes.value!.body);
    } catch (e) {
      print(e);
    }
  }

  products() async {
    try {
      late Rx<Response?> subProductRes = Rx<Response?>(null);
      subProductRes.value = await httpRepo.subProducts(
        lang: cacheUtils.getLang(),
        uid: cacheUtils.getUid(),
        token: cacheUtils.getToken(),
        category: cacheUtils.getCategory(),
        limitP: 20,
        offsetP: 0,
      );

      if (subProductRes.value == null) {
        return;
      }
      subProductModel.value =
          SubProductsModel.fromJson(subProductRes.value!.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    await subCate();
    await products();
    super.onInit();
  }
}
