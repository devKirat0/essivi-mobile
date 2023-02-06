import 'package:essivi_sarl_final/models/customer.dart';
import 'package:essivi_sarl_final/statics/widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/get_connexion_info.dart';
import '../statics/static_attributs.dart';
import 'navigation_drawer.dart';

class HomeScreen extends StatefulWidget{
  Map<dynamic,dynamic> informations;
  List<String> menus;
  List<Customer>? customers;
  HomeScreen({super.key, required this.informations,required this.menus,required this.customers});

  @override
  State<StatefulWidget> createState() => _HomeScreenState(this.informations,this.menus,this.customers);

}
class _HomeScreenState extends State<HomeScreen>{
  List<Customer>? customers =[];
  Map informations = {};
  List<String> menus = [];
  _HomeScreenState(this.informations,this.menus,this.customers);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          Statics.textEnterprise,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),
      drawer: NavigationDrawer( informations: informations,menus:menus,customers: customers,),
      body: ListView.builder(
        itemCount: customers?.length,
        itemBuilder: (context,index){
          if (kDebugMode) {
            print("******************************** ${customers?.length} ********************************");
          }
          return MyWidget().orderWidget(context,customers?.elementAt(index));
        },
      ),
      floatingActionButton: MyWidget().floatingActionButton(context),
    );
  }

}