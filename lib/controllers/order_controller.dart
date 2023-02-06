import 'package:dio/dio.dart';
import 'package:essivi_sarl_final/statics/order_static_attributs.dart';
import 'package:essivi_sarl_final/statics/static_attributs.dart';
import 'package:flutter/foundation.dart';

class OrderController{
  static String? host = Statics.baseURL['host1'];

  static Future<dynamic> getOrders() async {
    final Dio dio = Dio();

    try{
      if (kDebugMode) {
        print("$host/test/");
      }

    } on DioError catch(e){
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