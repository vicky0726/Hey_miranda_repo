import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CustomPreferences {
  //Save particular key value to sp
  static setPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  //Save particular bool value to sp
  static setPrerefencesBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  //Get particular key value to sp
  static getPreferencesBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(key)!;
    return boolValue;
  }

  //Get particular key value to sp
  static getPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key).toString();
    return stringValue;
  }

  //Remove particular key value from sp
  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  //Clear all key value from sp
  static clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  //read key value to sp
  static read(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key).toString());
  }

  //save key value to sp
  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }
}
