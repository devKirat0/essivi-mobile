import 'package:dio/dio.dart';
import 'package:essivi_sarl_final/controllers/category_controller.dart';
import 'package:essivi_sarl_final/controllers/get_connexion_info.dart';
import 'package:essivi_sarl_final/models/product.dart';
import 'package:essivi_sarl_final/models/category.dart' as category_module;
import 'package:essivi_sarl_final/statics/static_attributs.dart';
import 'package:essivi_sarl_final/statics/product_static_attributs.dart';
import 'package:flutter/foundation.dart';

class ProductController{

  static String? host = Statics.baseURL['host1'];

  static Future<dynamic> getProduct(int id) async{
    final Dio dio = Dio();

    try{
      if (kDebugMode) {
        print("$host/${ProductStaticAttributs.getAProduct}/$id?idProduct=$id");
      }
      Map informations = await GetConnexionInfo.getConnexion();
      final response = await dio.get(
        "$host/${ProductStaticAttributs.getAProduct}/$id?idProduct=$id",
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "${informations['token_type']} ${informations['access_token']}"
          })
      );
      category_module.Category category = await CategoryController.getCategory(response.data['category_id']);
      if (kDebugMode) {
        print(response.data);
      }
      return Product(id:id,labelOfProduct: response.data['labelOfProduct'],unitPrice: response.data['unitPrice'],productQuantity: response.data['productQuantity'], category: category);
    } on DioError catch (e){
      if (kDebugMode) {
        print(e);
      }
    }
  }
}