import 'package:dio/dio.dart';
import 'package:essivi_sarl_final/controllers/product_controller.dart';
import 'package:essivi_sarl_final/models/customer.dart';
import 'package:essivi_sarl_final/models/order.dart';
import 'package:essivi_sarl_final/models/product.dart';
import 'package:essivi_sarl_final/statics/static_attributs.dart';
import 'package:essivi_sarl_final/statics/user_static_attributs.dart';
import 'package:flutter/foundation.dart';

class UserController{

  static String? host = Statics.baseURL['host1'];

  static Future<List<Customer>?> getCustomersOfUserByHisId(int id,Map informations) async{
    final Dio dio = Dio();

    try{
      if (kDebugMode) {
        print(informations['user_id']);
        print("$host/${UserStaticAttributs.getBy}/${informations['user_id']}");
      }
      final response = await dio.get(
        "$host/${UserStaticAttributs.getBy}/${informations['user_id']}?idUser=${informations['user_id']}",
          options: Options(headers: {
            "accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "${informations['token_type']} ${informations['access_token']}"
          })
      );
      List<Customer> customers = [];
      for(dynamic e in response.data['customers']){
        List<Order> orders = [];
        for(dynamic o in e['orders']){
          Product product = await ProductController.getProduct(o['product_id']);
          orders.add(
            Order(
                ordered_quantity: o['ordered_quantity'],
                ordered_date: o['ordered_date'],
                customer_id: o['customer_id'],
                product_id: o['product_id'],
                product: product
            )
          );
        }
        customers.add(
            Customer(
                firstnameOfCustomer: e['firstnameOfCustomer'],
                lastnameOfCustomer: e['lastnameOfCustomer'],
                customerPhone: e['customerPhone'],
                longitude: e['longitude'],
                latitude: e['latitude'],
                orders: orders
            )
        );
      }
      if (kDebugMode) {
        print("************ ${response.data['customers']} *************");
        print("************ $customers *************");
      }
      return customers;
    } on DioError catch(e){
      if (kDebugMode) {
        print("****************** Error at : $host/${UserStaticAttributs.getBy}/${informations['user_id']} ******************");
      }
    }
  }
}