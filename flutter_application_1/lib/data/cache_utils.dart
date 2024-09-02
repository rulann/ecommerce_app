import 'dart:async';
import 'package:get_storage/get_storage.dart';

class CacheUtils {
  final GetStorage _getStorage;

  CacheUtils(this._getStorage);

  static const _emailKey = 'mail';
  static const _phoneKey = 'phone_number';
  static const _birthDateKey = 'birth_date';
  static const _tokenKey = 'token';
  static const _uidKey = 'uid';
  static const _langKey = 'lang';
  static const _pidKey = 'pid';
  static const _categoryKey = 'category';
  static const _subCategoryKey = 'category';
  static const _vidKey = 'vid';
  static const _lang = 'lang';

  bool isLoggedIn() {
    return _getStorage.hasData(_uidKey) && _getStorage.hasData(_tokenKey);
  }

  getUid() {
    return _getStorage.read(_uidKey) ?? '';
  }

  getToken() {
    return _getStorage.read(_tokenKey) ?? '';
  }

  void setPid(String pid) {
    _getStorage.write(_pidKey, pid);
  }

  getPid() {
    return _getStorage.read(_pidKey);
  }

  setCategory(String category) {
    _getStorage.write(_categoryKey, category);
  }

  getCategory() {
    return _getStorage.read(_categoryKey);
  }

  setSubCategory(String subCategory) {
    _getStorage.write(_subCategoryKey, subCategory);
  }

  getSubCategory() {
    return _getStorage.read(_subCategoryKey);
  }

  saveUserSession(final token) {
    _getStorage.write(_tokenKey, token);
  }

  setVid(String id) {
    _getStorage.write(_vidKey, id);
  }

  getVid() {
    return _vidKey;
  }

  setLang(String code) {
    _getStorage.write(_lang, code);
  }

  getLang() {
    return _getStorage.read(_lang);
  }

  Future<void> Login(
      {required String mail,
      required String uid,
      required String token}) async {
    _getStorage.write(_emailKey, mail);
    _getStorage.write(_tokenKey, token);
    _getStorage.write(_uidKey, uid);
  }

  Future<void> Signup({
    required String mail,
    required String uid,
    required String token,
    required String phoneNumber,
    required String birthDate,
    required String lang,
  }) async {
    _getStorage.write(_langKey, lang);
    _getStorage.write(_emailKey, mail);
    _getStorage.write(_uidKey, uid);
    _getStorage.write(_tokenKey, token);
    _getStorage.write(_phoneKey, phoneNumber);
    _getStorage.write(_birthDateKey, birthDate);
  }

  Future<void> SignOut() async {
    _getStorage.remove(_uidKey);
    _getStorage.remove(_tokenKey);
    _getStorage.erase();
  }
}
