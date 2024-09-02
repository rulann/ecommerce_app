import 'dart:convert';

import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo-implement.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/models/add_to_cart_model.dart';
import 'package:flutter_application_1/views/models/delete_from_cart_model.dart';
import 'package:flutter_application_1/views/models/update_cart_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContantActions {
  static HttpRepo httpRepo = HttpRepoImplement();
  static CacheUtils cacheUtils = CacheUtils(GetStorage());

  static Rx<AddToCartModel?> addtoCartModel = Rx<AddToCartModel?>(null);
  static Rx<RemoveFromCartModel?> removefromCartModel =
      Rx<RemoveFromCartModel?>(null);
  static Rx<UpdateCartModel?> updateModel = Rx<UpdateCartModel?>(null);

  static add(String vId, String quant) async {
    try {
      late Rx<Response?> addtoCartRes = Rx<Response?>(null);

      addtoCartRes.value = await httpRepo.addToCart(
          lang: cacheUtils.getLang(),
          uid: cacheUtils.getUid(),
          token: cacheUtils.getToken(),
          vid: vId,
          quantity: quant);

      if (addtoCartRes.value == null) {
        print('addtoCartRes is null');
        return;
      }

      addtoCartModel.value = AddToCartModel.fromJson(addtoCartRes.value!.body);

      print('add to cart res body: ${addtoCartRes.value!.body}');
    } catch (e) {
      print(e);
    }
  }

  static remove(String item) async {
    try {
      late Rx<Response?> removefromCartRes = Rx<Response?>(null);

      removefromCartRes.value = await httpRepo.removeFromCart(
        lang: cacheUtils.getLang(),
        uid: cacheUtils.getUid(),
        token: cacheUtils.getToken(),
        itemID: item,
      );

      if (removefromCartRes.value == null) {
        return;
      }

      removefromCartModel.value =
          RemoveFromCartModel.fromJson(removefromCartRes.value!.body);

      print('remove from cart res body: ${removefromCartRes.value!.body}');
      var resBody = jsonDecode(removefromCartRes.value!.body);
      if (resBody['status'] == 200) {
        print('Item removed successfully');
      } else {
        print('Failed to remove item: ${resBody['message']}');
      }
    } catch (e) {
      print(e);
    }
  }

  static update(String item, String count, String order) async {
    try {
      late Rx<Response?> updateRes = Rx<Response?>(null);

      updateRes.value = await httpRepo.updateCart(
          lang: cacheUtils.getLang(),
          uid: cacheUtils.getUid(),
          token: cacheUtils.getToken(),
          itemID: item,
          orderID: order,
          quantity: count);

      if (updateRes.value == null) {
        return;
      }

      updateModel.value = UpdateCartModel.fromJson(updateRes.value!.body);
    } catch (e) {
      print('update cart error: ${e}');
    }
  }
}
