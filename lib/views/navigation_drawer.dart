import 'package:essivi_sarl_final/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:essivi_sarl_final/statics/static_attributs.dart';

import '../statics/widget.dart';

class NavigationDrawer extends StatefulWidget{

  List<Customer>? customers;
  Map<dynamic,dynamic> informations;
  List<String> menus;

  NavigationDrawer({super.key,required this.informations,required this.menus,required this.customers});

  @override
  State<StatefulWidget> createState() => _NavigationState(informations,menus,customers);
}

class _NavigationState extends State<NavigationDrawer>{
  List<Customer>? customers;
  Map<dynamic,dynamic> informations;
  List<String> menus;
  _NavigationState(this.informations,this.menus,this.customers);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context,informations['user_login'].toUpperCase()),
            buildMenuItems(context,customers),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context,String nomAgent) => Container(
    color: Colors.blue,
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/4,
          margin: const EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              Statics.logo,
            ),
          ),
        ),
        const Text(
          Statics.textEnterprise,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),
        Text(
          "AGENT : $nomAgent",
          style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              color: Colors.white
          ),
        ),
      ],
    ),
  );


  Widget buildMenuItems(BuildContext context,List<Customer>? customers){
    print("***************** ${menus.length}**********************");
    return Container(
        padding: const EdgeInsets.all(24),
        child : Wrap(

          runSpacing: 16,
          children: [
            /*MyWidget().listTitle(context,Icons.home, "Livraisons",25,Colors.black54,informations),
          MyWidget().listTitle(context,Icons.check, "Récapitulatifs",25,Colors.greenAccent,informations),
          MyWidget().listTitle(context,Icons.info, "Informations",25,Colors.lightBlueAccent,informations),*/
            /*ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context,index){
                return Text("hello");
              },
            ),*/
            for(String menuTitle in menus)
              MyWidget().listTitle(context,Icons.home_outlined, menuTitle,25,Colors.redAccent,informations,menus,customers),

            MyWidget().listTitle(context,Icons.logout, "Deconnexion",25,Colors.redAccent,informations,menus,customers),
          ],
        )
    );
  }
}