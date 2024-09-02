import 'package:get/get_connect/http/src/response/response.dart';

abstract class HttpRepo {
  Future<Response?> logIn({
    required String lang,
    required String mail,
    required String password,
  });

  Future<Response?> signUp({
    required String lang,
    required String mail,
    required String password,
    required String birth_date,
    required String phone_number,
  });

  Future<Response?> sliderImg({
    required String lang,
    required String uid,
    required String token,
  });

  Future<Response?> shopByCategory({
    required String lang,
    required String uid,
    required String token,
    required int limit,
    required int offset,
  });

  Future<Response?> bestDeals({
    required String lang,
    int type,
    required String uid,
    required String token,
    required int limit,
    required int offset,
  });

  Future<Response?> productDetails({
    required String lang,
    required String uid,
    required String token,
    required String pid,
  });

  Future<Response?> subCategory({
    required String lang,
    required String uid,
    required String token,
    required String category,
    required int limitC,
    required int offsetC,
    required int limitP,
    required int offsetP,
  });

  Future<Response?> subProducts({
    required String lang,
    required String uid,
    required String token,
    required int limitP,
    required int offsetP,
    required String category,
  });

  Future<Response?> addToCart({
    required String lang,
    required String uid,
    required String token,
    required String vid,
    required String quantity,
  });

  Future<Response?> viewCart({
    required String lang,
    required String uid,
    required String token,
  });

  Future<Response?> removeFromCart({
    required String lang,
    required String uid,
    required String token,
    required String itemID,
  });

  Future<Response?> updateCart({
    required String lang,
    required String uid,
    required String token,
    required String itemID,
    required String orderID,
    required String quantity,
  });
}
