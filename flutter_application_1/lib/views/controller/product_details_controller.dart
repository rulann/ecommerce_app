import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/product_details_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductDetailsController extends GetxController {
  final HttpRepo httpRepo;
  final CacheUtils cacheUtils;

  ProductDetailsController({
    required this.httpRepo,
    required this.cacheUtils,
  });

  Rx<ProductDetailsModel?> productModel = Rx<ProductDetailsModel?>(null);

  viewProductDetails() async {
    try {
      late Rx<Response?> ProductRes = Rx<Response?>(null);

      ProductRes.value = await httpRepo.productDetails(
        lang: 'en',
        uid: cacheUtils.getUid(),
        token: cacheUtils.getToken(),
        pid: cacheUtils.getPid(),
      );

      if (ProductRes.value == null) {
        return;
      }

      productModel.value = ProductDetailsModel.fromJson(ProductRes.value!.body);
    } catch (e) {
      print('error: ${e}');
    }
  }

  @override
  void onInit() async {
    await viewProductDetails();
    super.onInit();
  }
}
