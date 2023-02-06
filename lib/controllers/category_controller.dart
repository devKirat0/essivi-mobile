import 'package:dio/dio.dart';
import 'package:essivi_sarl_final/controllers/get_connexion_info.dart';
import 'package:essivi_sarl_final/models/category.dart' as cat_module;
import 'package:essivi_sarl_final/statics/category_static_attributs.dart';
import 'package:essivi_sarl_final/statics/static_attributs.dart';
import 'package:flutter/foundation.dart';


class CategoryController{
  static String? host = Statics.baseURL['host1'];

  static Future<dynamic> getCategory(int id) async{
    final Dio dio = Dio();

    try{
      if (kDebugMode) {
        print("$host/${CategoryStaticAttributs.getACategory}/$id");
      }
      Map informations = await GetConnexionInfo.getConnexion();
      final response = await dio.get(
          "$host/${CategoryStaticAttributs.getACategory}/$id",
          options: Options(headers: {
          "accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "${informations['token_type']} ${informations['access_token']}"
          })
      );
      return cat_module.Category(id: id, labelOfCat: response.data['labelOfCat']);
  }on DioError catch(e){
      if (kDebugMode) {
        print(e);
      }
  }
}
}