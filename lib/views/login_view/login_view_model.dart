import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:messdienerplan_webinterface/api/messdiener_api.dart';
import 'package:messdienerplan_webinterface/api/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {
  var username = ''.obs;
  var password = ''.obs;
  var loginFailed = false.obs;

  Future<bool> loginUser() async {
    var client = Get.find<MessdienerApiClient>();

    Token token;

    try {
      token = await client.loginUser(
          LoginModel(username: username(), password: password(), email: ''));
    } catch (e) {
      loginFailed(true);
      return false;
    }

    var dio = Get.find<Dio>();
    dio.options.headers.clear();
    dio.options.headers['Authorization'] = 'Token ' + token.key;
    var prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token.key);

    return true;
  }
}
