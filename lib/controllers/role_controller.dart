import 'package:dio/dio.dart';
import 'package:essivi_sarl_final/statics/role_static_attributs.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../statics/login_static_attributs.dart';
import '../statics/static_attributs.dart';
import 'package:flutter/material.dart';

import 'get_connexion_info.dart';

class RoleController {

  static String? host = Statics.baseURL['host1'];

  static Future<List<String>> getMenus(Map informations) async {
    final Dio dio = Dio();

    try {
      if (kDebugMode) {
        print("$host/${RoleStaticAttributs.getRoles}/${informations['role_id']}");
      }
      final response = await dio.get(
          "$host/${RoleStaticAttributs.getRoles}/${informations['role_id']}",
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "${informations['token_type']} ${informations['access_token']}"
          }));
      List<String> responseString = response.data['menus'].map<String>((dynamic e) => e['label'].toString()).toList();
      return responseString;
    } on DioError catch (e) {
      if (e.response != null && e.response?.statusCode == 422) {
        // Handle validation error
        if (kDebugMode) {
          print(e.response?.data);
          var error = e.response?.data['error'];
          print(error);
        }
      } else {
        // Handle other errors
        if (kDebugMode) {
          print(e);
        }
      }
      return ["failed"];
    }
  }

}