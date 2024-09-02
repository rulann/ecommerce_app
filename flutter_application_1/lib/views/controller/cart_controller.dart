import 'package:flutter_application_1/constant/actions/actions.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/delete_from_cart_model.dart';
import 'package:flutter_application_1/views/models/view_cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final HttpRepo httpRepo;
  final CacheUtils cacheUtils;

  CartController({
    required this.httpRepo,
    required this.cacheUtils,
  });

  Rx<ViewCartModel?> viewCartModel = Rx<ViewCartModel?>(null);
  Rx<RemoveFromCartModel?> remove = Rx<RemoveFromCartModel?>(null);

  Future<void> inc(RxInt count, String item, String order) async {
    count++;
    await ContantActions.update(item, count.value.toString(), order);
    await view();
    update();
  }

  Future<void> dec(RxInt count, String item, String order) async {
    if (count.value > 1) {
      count.value--;
      await ContantActions.update(item, count.value.toString(), order);
      await view();
      update();
    } else {
      Get.defaultDialog(
        middleText: 'Are you sure you want to remove this item',
        textConfirm: 'yes',
        onConfirm: () async {
          await ContantActions.remove(item);
          await ContantActions.update(item, count.value.toString(), order);
          await view();
          update();
          Get.back();
        },
        onCancel: () => {Get.back()},
      );
    }
  }

  Future<void> view() async {
    try {
      late Rx<Response?> viewCartRes = Rx<Response?>(null);

      viewCartRes.value = await httpRepo.viewCart(
          lang: cacheUtils.getLang(), uid: cacheUtils.getUid(), token: cacheUtils.getToken());

      if (viewCartRes.value == null) {
        return;
      }

      viewCartModel.value = ViewCartModel.fromJson(viewCartRes.value!.body);
    } catch (e) {
      print(' view cart error: ${e}');
    }
  }

  @override
  void onInit() async {
    await view();
    super.onInit();
  }
}
