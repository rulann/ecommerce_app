import 'dart:convert';
import 'package:flutter_application_1/data/api_url.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:get/get.dart';

class HttpRepoImplement extends GetConnect implements HttpRepo {
  @override
  Future<Response?> logIn({
    required String lang,
    required String mail,
    required String password,
    String social_media = '1',
    String mobile_type = '1',
    String player_id = '123',
  }) async {
    final formData = FormData({
      "lang": lang,
      "mail": mail,
      "password": password,
      "social_media": social_media,
      "mobile_type": mobile_type,
      "player_id": player_id
    });

    var res = await post(ApiUrl.logIn, formData);
    if (res.isOk) {
      print('login res is ok');
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.bodyString!);
        print('resBody: ${resBody}');
        if (resBody['status'] == 401) {
          Get.defaultDialog(
              title: 'user doesn\'t exist please sign up',
              middleText: '',
              onConfirm: () {
                Get.toNamed('/signup');
              },
              onCancel: () {
                Get.back();
              });
        } else if (resBody['status'] == 200) {
          Get.defaultDialog(
              title: 'login succes',
              middleText: '',
              onConfirm: () {
                Get.toNamed('/home');
              });
        } else {
          Get.defaultDialog(
              title: resBody[
                  'message'], //type 'Null' is not a subtype of type 'String'
              middleText: '',
              onConfirm: () {
                Get.back();
              });
        }
      } else if (res.hasError) {
        print('login error: ${res.statusText} error code: ${res.statusCode}');
      }
      return res;
    }
  }

  @override
  Future<Response?> signUp({
    required String lang,
    required String mail,
    required String password,
    required String birth_date,
    required String phone_number,
  }) async {
    final formData = FormData({
      "lang": lang,
      "mail": mail,
      "password": password,
      "birth_date": birth_date,
      "phone_number": phone_number,
    });

    var res = await post(ApiUrl.signUp, formData);
    if (res.isOk) {
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.bodyString!);
        print('sign up res is ok');

        if (resBody['status'] == 200) {
          Get.defaultDialog(
            title: 'sign up success',
            middleText: '',
            onConfirm: () => Get.toNamed('/login'),
          );
        } else {
          Get.defaultDialog(
            title: resBody['message'],
            middleText: '',
            onConfirm: () {
              Get.back();
            },
          );

          print('status code: ${res.statusCode}');
        }
      }
    }
    return res;
  }

  @override
  Future<Response?> sliderImg(
      {required String lang,
      required String uid,
      required String token}) async {
    final formData = FormData({
      'lang': lang,
      "uid": uid,
      "token": token,
    });
    var res = await post(ApiUrl.slider, formData);

    if (res.isOk) {
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.bodyString!);
        print('slider is ok');
      }
    }
    return res;
  }

  @override
  Future<Response?> shopByCategory(
      {required String lang,
      required String uid,
      required String token,
      required int limit,
      required int offset}) async {
    final formData = FormData({
      "lang": lang,
      "uid": uid,
      "token": token,
      "limit": limit,
      "offset": offset
    });

    var res = await post(ApiUrl.shopBy, formData);

    if (res.isOk) {
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.bodyString!);
        print('shop by category is ok');
      }
    }
    return res;
  }

  @override
  Future<Response?> bestDeals(
      {required String lang,
      int type = 1,
      required String uid,
      required String token,
      required int limit,
      required int offset}) async {
    final formData = FormData({
      "lang": lang,
      "uid": uid,
      "token": token,
      "limitProduct": limit,
      "offsetProduct": offset,
      'type': type
    });

    var res = await post(ApiUrl.bestDeals, formData);

    if (res.isOk) {
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.bodyString!);
        print('best deals is ok');
      }
    }
    return res;
  }

  @override
  Future<Response?> productDetails(
      {required String lang,
      required String uid,
      required String token,
      required String pid}) async {
    final formData = FormData({
      "lang": lang,
      "uid": uid,
      "token": token,
      "pid": pid,
    });

    var res = await post(ApiUrl.product, formData);

    if (res.isOk) {
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.bodyString!);
        print('product details is ok');
      }
    }
    return res;
  }

  @override
  Future<Response?> subCategory(
      {required String lang,
      required String uid,
      required String token,
      required String category,
      required int limitC,
      required int offsetC,
      required int limitP,
      required int offsetP}) async {
    final formData = FormData({
      'lang': lang,
      'uid': uid,
      "token": token,
      'category': category,
      'limitCategory': limitC,
      'offsetCategory': offsetC,
      'limitProduct': limitP,
      'offsetProduct': offsetP,
    });
  }
}
