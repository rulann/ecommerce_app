import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/best_deals_model.dart';
import 'package:flutter_application_1/views/models/shop_by_category_model.dart';
import 'package:flutter_application_1/views/models/slider_model.dart';
import 'package:flutter_application_1/views/models/subCategory_model.dart';
import 'package:flutter_application_1/views/pages/subCategory.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HttpRepo httpRepo;
  final CacheUtils cacheUtils;

  HomeController({required this.httpRepo, required this.cacheUtils});

  RxInt selectedLang = 1.obs;
  RxInt currentIndex = 0.obs;
  RxInt productsLimit = 4.obs;

  Rx<ShopByCategoryModel?> shopByModel = Rx<ShopByCategoryModel?>(null);
  Rx<BestDealsModel?> bestDealsModel = Rx<BestDealsModel?>(null);
  Rx<SliderModel?> sliderModel = Rx<SliderModel?>(null);
  //Rx<SubCategoryModel?> subModel = Rx<SubCategoryModel?>(null);

  void changeLanguage(int value) {
    selectedLang.value = value;
  }

  void updateSliderIndex(int index) {
    currentIndex.value = index;
  }

  sliderImg() async {
    try {
      late Rx<Response?> sliderRes = Rx<Response?>(null);
      sliderRes.value = await httpRepo.sliderImg(
          lang: 'en', uid: cacheUtils.getUid(), token: cacheUtils.getToken());

      if (sliderRes.value == null) return;

      sliderModel.value = SliderModel.fromJson(sliderRes.value!.body);
    } catch (e) {
      print(e);
    }
  }

  shopByCategory() async {
    try {
      late Rx<Response?> shopByRes = Rx<Response?>(null);

      shopByRes.value = await httpRepo.shopByCategory(
          lang: 'en',
          uid: cacheUtils.getUid(),
          token: cacheUtils.getToken(),
          limit: 10000,
          offset: 0);

      if (shopByRes.value == null) {
        return;
      }

      shopByModel.value = ShopByCategoryModel.fromJson(shopByRes.value!.body);
    } catch (e) {
      print(e);
    }
  }

  bestDeals({int limit = 2}) async {
    try {
      late Rx<Response?> bestDealsRes = Rx<Response?>(null);

      bestDealsRes.value = await httpRepo.bestDeals(
          lang: 'en',
          uid: cacheUtils.getUid(),
          token: cacheUtils.getToken(),
          limit: limit,
          offset: 0,
          type: 1);

      if (bestDealsRes.value == null) {
        return;
      }

      bestDealsModel.value = BestDealsModel.fromJson(bestDealsRes.value!.body);
    } catch (e) {
      print('e: ${e}');
    }
  }

  viewAll() async {
    await bestDeals(limit: 1000);
  }

  // SubCategory() async {
  //   try {
  //     late Rx<Response?> subRes = Rx<Response?>(null);

  //     subRes.value = await httpRepo.subCategory(
  //         lang: 'en',
  //         uid: cacheUtils.getUid(),
  //         token: cacheUtils.getToken(),
  //         category: cacheUtils.getCategory(),
  //         limitC: 4,
  //         offsetC: 0,
  //         limitP: 20,
  //         offsetP: 0);

  //     if (subRes.value == null) return;

  //     subModel.value = SubCategoryModel.fromJson(subRes.value!.body);
  //   } catch (e) {
  //     print(e);
  //  }
  //}

  @override
  void onInit() async {
    await shopByCategory();
    await bestDeals();
    await sliderImg();

    super.onInit();
  }
}
