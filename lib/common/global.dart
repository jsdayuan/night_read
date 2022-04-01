import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static late SharedPreferences _prefs;

  static bool isLogin = false;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var user = _prefs.getString("user");

    isLogin = user != null;
  }

  static Future setUserAndUpdateIsLogin(String userStr) async {
    await _prefs.setString('user', userStr);

    isLogin = true;
  }

  static logout() async {
    await _prefs.remove('user');
    isLogin = false;
  }
}
