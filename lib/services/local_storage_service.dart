

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class LocalStorageService {
  SharedPreferences? _prefs;
  RxSharedPreferences? _rxPrefs;

  Future _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _initRxPrefs() {
    _rxPrefs ??= RxSharedPreferences.getInstance();
  }

  //get stream of stored variable types
  Stream<dynamic>? getRxStreamPref<T>(String key, T type) {
    _initRxPrefs();
    if (type is String) {
      return _rxPrefs!.getStringStream(key);
    } else if (type is int) {
      return _rxPrefs!.getIntStream(key);
    } else {
      return null;
    }
  }

  //get types
  dynamic getRxPref<T>(String key, T type) {
    _initRxPrefs();
    if (type is String) {
      return _rxPrefs!.getString(key);
    } else if (type is int) {
      return _rxPrefs!.getInt(key);
    } else if (type is List<String>) {
      return _rxPrefs!.getStringList(key) ;
    } else if (type is bool) {
      if (_rxPrefs!.getBool(key) != null) {
        print("from getBool ${_rxPrefs!.getBool(key)}");
        return _rxPrefs!.getBool(key) ;
      } else {
        return false ;
      }
    } else {
      return null;
    }
  }

  //set and store types
  dynamic setRxPref<T>(String key, T value) {
    _initRxPrefs();
    if (value is String) {
      _rxPrefs!.setString(key, value);
    } else if (value is int) {
      _rxPrefs!.setInt(key, value);
    } else if (value is List<String>) {
      _rxPrefs!.setStringList(key, value);
    } else if (value is bool) {
      _rxPrefs!.setBool(key, value);
    } else {
      _rxPrefs!.setString(key, value.toString());
    }
  }

  // set string list of values
  Future setStringList(String key, List<String> value) async {
    await _init();
    return _prefs!.setStringList(key, value);
  }

  // set string of values
  Future setPref(String key, String value) async {
    await _init();
    // print("Preference $key: $value");
    return _prefs!.setString(key, value);
  }

  // get string values
  Future<String?>? getPref(String key) async {
    await _init();
    return _prefs!.getString(key);
  }


  //clear stored values
  void dispose() {
    _rxPrefs!.dispose();
  }

  // save new values
  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // read stored local values
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(key);
    return data == null ? null : data;
  }

  // Save model
  saveModel(String key, value) async {
    var encodedValue = json.encode(value);
    save(key, encodedValue);
  }

  //delete stored values
  Future delete() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future deleteModel(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // read model from encoded json keys and value pairs
  Future readModel(String key) async {
    var encodedValue = await read(key);
    return encodedValue == null ? null : json.decode(encodedValue);
  }
}