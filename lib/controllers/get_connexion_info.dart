import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetConnexionInfo{

  static Future<void> setConnexion(String token,String type, int id, String login, int roleId,String label) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("access_token", token);
    prefs.setString("token_type", type);
    prefs.setInt("user_id", id);
    prefs.setString("user_login", login);
    prefs.setInt("role_id", roleId);
    prefs.setString("label", label);
  }

  static Future<Map> getConnexion() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map informations = {
      "access_token": prefs.getString("access_token"),
      "token_type": prefs.getString("token_type"),
      "user_id": prefs.getInt("user_id"),
      "user_login": prefs.getString("user_login"),
      "role_id": prefs.getInt("role_id"),
      "label": prefs.getString("label")
    };
    if (kDebugMode) {
      print(informations);
    }
    return informations;
  }

  static Future<void> removePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}