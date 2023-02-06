import 'package:essivi_sarl_final/controllers/role_controller.dart';
import 'package:essivi_sarl_final/controllers/user_controller.dart';
import 'package:essivi_sarl_final/models/customer.dart';
import 'package:essivi_sarl_final/statics/widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:essivi_sarl_final/statics/static_attributs.dart';
import 'package:essivi_sarl_final/statics/login_static_attributs.dart';
import 'package:essivi_sarl_final/controllers/get_connexion_info.dart';

import '../views/home_screen.dart';

class LoginController{

  static String? host = Statics.baseURL['host1'];

  static Future<dynamic> login(String login,String password,BuildContext context) async {
    //define dio and his options

    final Dio dio = Dio();
    bool isloading = true;
    
    /*showDialog(context: context, barrierDismissible: false,builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );});*/

    //try to login

    try{
      FormData formData = FormData.fromMap({
        "grant_type": "",
        "username": login,
        "password": password,
        "scope": "",
        "client_id": "",
        "client_secret": ""
      });
      if (kDebugMode) {
        print(host);
      }
      final response = await dio.post("$host/${LoginStaticAttributs.login}",data: formData,options: Options(headers: {
        "accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      }));

      if(response.statusCode==200){
        if(response.data['label']==Statics.agent){
          await GetConnexionInfo.setConnexion(response.data['access_token'], response.data['token_type'], response.data['user_id'], response.data['user_login'],response.data['role_id'],response.data['label']);
          Map<dynamic,dynamic> info = await GetConnexionInfo.getConnexion();
          List<String> menus = await RoleController.getMenus(info);
          List<Customer>? customers = await UserController.getCustomersOfUserByHisId(info['user_id'], info);
          isloading=false;
          if (kDebugMode) {
            print(menus);
            print("************************MENUS***************************");
            print('*****************************info nom login : ${info['user_login']}****************************************');
            print('***************************** ${customers?.first.latitude} ****************************************');
          }
          if(isloading==false){
            //Navigator.of(context).pop(context);
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(informations: info,menus:menus,customers: customers,)));
          return "Success";
        }else{
          isloading=false;
          if(isloading==false){
            //Navigator.pop(context);
          }
          showDialog(context: context, builder: (ctx)=>MyWidget().alertDialog(ctx,'UnAuthorized'));
          return "Not allowed";
        }
      }
    }on DioError catch(e){
      isloading=false;
      if (e.response != null && e.response?.statusCode == 422) {
        // Handle validation error
        //print(e.response?.data);
        var error = e.response?.data['error'];
        if (kDebugMode) {
          print(error);
        }
      } else {
        // Handle other errors
        if(isloading==false){
          //Navigator.of(context).pop();
        }
        showDialog(context: context, builder: (ctx)=>MyWidget().alertDialog(ctx,'404'));
        //print(e);
      }
      //print(e.toString());
      return e.toString();
    }

  }
}