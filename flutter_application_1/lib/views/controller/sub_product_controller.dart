import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/subCategory_model.dart';
import 'package:flutter_application_1/views/models/sub_products_model.dart';
import 'package:get/get.dart';

class SubProductController extends GetxController {
  late final HttpRepo httpRepo;
  late final CacheUtils cacheUtils;

  SubProductController({required this.httpRepo, required this.cacheUtils});

  Rx<SubProductsModel?> subProductModel = Rx<SubProductsModel?>(null);
  Rx<SubCategoryModel?> subModel = Rx<SubCategoryModel?>(null);

  subProducts() async {
    try {
      late Rx<Response?> subProductRes = Rx<Response?>(null);
      subProductRes.value = await httpRepo.subProducts(
        lang: cacheUtils.getLang(),
        uid: cacheUtils.getUid(),
        token: cacheUtils.getToken(),
        category: cacheUtils.getSubCategory(),
        limitP: 20,
        offsetP: 0,
      );

      if (subProductRes.value == null ||
          subProductRes.value?.body['status'] == 400) {
        print('No products found or response body is null');
        return;
      }

      print("API response body: ${subProductRes.value!.body}");
      subProductModel.value =
          SubProductsModel.fromJson(subProductRes.value!.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    await subProducts();
    super.onInit();
  }
}
