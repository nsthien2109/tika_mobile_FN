import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@override

  dynamic setBoolStorage(key, val) async {
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      var _res = prefs.setBool(key, val);
      debugPrint("Set $key : $val");
      return _res;
  }

  dynamic getBoolStorage(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.getBool(key);
    debugPrint('Get $key : $_res');
    return _res;
  }

  dynamic setStringStorage(key, value) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
      var _res = prefs.setString(key, value);
      debugPrint("Set $key : $value");
    return _res;
  }

  dynamic getStringStorage(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
      var _res = prefs.getString(key);
      debugPrint("Get $key : $_res");
    return _res;
  }

  Future<bool> removeKey(key) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }

  Future resetStorage() async {
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      prefs.clear();
  }