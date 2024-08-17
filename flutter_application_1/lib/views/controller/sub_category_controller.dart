import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/subCategory_model.dart';
import 'package:get/get.dart';

class SubCategoryController extends GetxController {
  late final HttpRepo httpRepo;
  late final CacheUtils cacheUtils;

  SubCategoryController({required this.httpRepo, required this.cacheUtils});

  Rx<SubCategoryModel?> subModel = Rx<SubCategoryModel?>(null);

  subCate() async {
    try {
      late Rx<Response?> subRes = Rx<Response?>(null);
      subRes.value = await httpRepo.subCategory(
        lang: 'en',
        uid: cacheUtils.getUid(),
        token: cacheUtils.getToken(),
        category: '',
        limitC: 0,
        offsetC: 0,
        limitP: 0,
        offsetP: 0,
      );

      if (subRes.value == null) {
        return;
      }

      subModel.value = SubCategoryModel.fromJson(subRes.value!.body);
    } catch (e) {}
  }
}
