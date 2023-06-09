import 'dart:math';

import 'package:essivi_sarl_final/models/customer.dart';
import 'package:essivi_sarl_final/models/order.dart';
import 'package:essivi_sarl_final/views/password_forgotten_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:essivi_sarl_final/controllers/login_controller.dart';
import 'package:essivi_sarl_final/statics/static_attributs.dart';
import 'package:essivi_sarl_final/controllers/get_connexion_info.dart';
import 'package:essivi_sarl_final/controllers/product_controller.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../views/home_screen.dart';
import '../views/customerCommands.dart';

class MyWidget {
  Widget imageEssivi(
      BuildContext context, double paddingRL, double paddingBottom) {
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        margin: EdgeInsets.only(
            right: paddingRL, left: paddingRL, bottom: paddingBottom),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset(
            Statics.logo,
          ),
        ));
  }

  Widget usernameInputWidget(double paddingValue, double paddingBottomValue,
      String hint, TextEditingController usernameController) {
    return Container(
      margin: EdgeInsets.only(
          left: paddingValue, right: paddingValue, bottom: paddingBottomValue),
      child: TextField(
        controller: usernameController,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white)),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget passwordInputWidget(double paddingValue, double paddingBottomValue,
      String hint, TextEditingController passwordController) {
    return Container(
      margin: EdgeInsets.only(
          left: paddingValue, right: paddingValue, bottom: paddingBottomValue),
      child: TextField(
        controller: passwordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white)),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget textEssivi(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 37,
          color: Colors.white),
    );
  }

  Widget textButtonWidget(
      double marginRL, double marginB, BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: marginRL, bottom: marginB),
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PasswordForgotScreen()));
        },
        child: const Text(Statics.forgotPasswordText),
      ),
    );
  }

  Widget login(TextEditingController usernameController,
      TextEditingController passwordController, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade500,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
      ),
      onPressed: () {
        LoginController.login(
            usernameController.text, passwordController.text, context);
      },
      child: const Text(
        Statics.loginText,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget listTitle(
      BuildContext context,
      IconData icon,
      String text,
      double size,
      Color color,
      Map<dynamic, dynamic> informations,
      List<String> menus,
      List<Customer>? customers) {
    if (text.toUpperCase() == 'LIVRAISONS') {
      icon = Icons.delivery_dining;
      color = Colors.blue;
    } else if (text.toUpperCase() == 'COMMANDES') {
      //icon = Icons.delivery_dining;
      icon = Icons.shopping_cart;
      color = Colors.orangeAccent;
    }
    Widget menusWidget = ListTile(
      leading: Icon(
        icon,
        size: size,
        color: color,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
      ),
      onTap: () => {
        if (text.toUpperCase() == 'LIVRAISONS')
          {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(
                      informations: informations,
                      menus: menus,
                      customers: customers,
                    )))
          }
        else if (text.toUpperCase() == 'COMMANDES')
          {}
        else if (text == "")
          {}
        else if (text.toUpperCase() == 'DECONNEXION')
          {
            GetConnexionInfo.removePrefs(),
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const MyApp()))
          }
      },
    );

    return menusWidget;
  }

  Widget alertDialog(BuildContext context, String text) {
    return AlertDialog(
      title: const Text('Erreur de Connexion'),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (text == '404')
            const Text(
              'Username ou mot de passe \nincorrecte.',
              style: TextStyle(fontSize: 20),
            )
          else
            const Text(
              'Vous n\'avez pas accès \nà cette application',
              style: TextStyle(fontSize: 20),
            )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget textWidget(double paddingValue, double paddingBottomValue) {
    return Container(
      margin: EdgeInsets.only(
          left: paddingValue,
          right: paddingValue,
          bottom: paddingBottomValue,
          top: 0),
      child: const Text(
        textAlign: TextAlign.center,
        Statics.textPasswordForgottenEnterLogin,
        style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat'),
      ),
    );
  }

  Widget inputWidget(double paddingValue, double paddingBottomValue,
      String hint, TextEditingController login) {
    return Container(
      margin: EdgeInsets.only(
        left: paddingValue,
        right: paddingValue,
        bottom: paddingBottomValue,
      ),
      child: TextField(
        controller: login,
        decoration:
            InputDecoration(border: const OutlineInputBorder(), hintText: hint),
      ),
    );
  }

  Widget validate(BuildContext context, TextEditingController login) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            debugPrint("Your username is ${login.text}");
            showDialog(
                context: context, builder: (context) => dialogWidget(context));
          },
          child: const Text(
            Statics.validate,
            style: TextStyle(fontSize: 20),
          )),
    );
  }

  Widget dialogWidget(BuildContext context) {
    return AlertDialog(
      title: const Text(
        Statics.success,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 25),
      ),
      content: const Text(Statics.passwordMessage,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 18)),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('OK'))
      ],
    );
  }

  Widget subscribeClient(BuildContext context) {
    return AlertDialog(
      title: const Text(
        Statics.subscribeText,
        style: TextStyle(fontSize: 24, fontFamily: 'Montserrat'),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(),
      ),
    );
  }

  Widget floatingActionButton(
      BuildContext context,
      TextEditingController firstName,
      TextEditingController lastName,
      TextEditingController phoneNumber,
      TextEditingController latitude,
      TextEditingController longitude) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          onPressed: () {
            // Code à exécuter lorsque le bouton 2 est cliqué
          },
          child: const Icon(Icons.shopping_cart),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            // Code à exécuter lorsque le bouton 1 est cliqué
            showDialog(
                context: context,
                builder: (ctx) => clientDialogSubscription(ctx, firstName,
                    lastName, phoneNumber, latitude, longitude));
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget orderWidget(BuildContext context, Customer? customer) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${customer!.lastnameOfCustomer} ${customer.firstnameOfCustomer}",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.phone,
                size: 30,
                color: Colors.green,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                customer.customerPhone,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.orangeAccent,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Total Commandes : ${customer.orders.length}",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CustomerCommands(customer: customer)));
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.blue,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget anOrder(BuildContext context, Order order) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.date_range,
                color: Colors.blueAccent,
                size: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                DateFormat('dd-MM-yyyy à kk:mm')
                    .format(DateTime.parse(order.ordered_date)),
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.shopping_bag,
                color: Colors.orangeAccent,
                size: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${order.ordered_quantity} ${order.product.labelOfProduct} en ${order.product.category.labelOfCat}",
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: Colors.black,
                size: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${order.product.unitPrice} FCFA l'unité",
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Valider',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget clientDialogSubscription(
      BuildContext context,
      TextEditingController firstName,
      TextEditingController lastName,
      TextEditingController phoneNumber,
      TextEditingController latitude,
      TextEditingController longitude) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      /*horizontal: (MediaQuery.of(context).size.width*5)/100,*/
                      vertical: MediaQuery.of(context).size.height * 2 / 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "client".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 25, fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width * 5) / 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nom",
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 100,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 5 / 100,
                          child: TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            controller: lastName,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width * 5) / 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Prénom",
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 100,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 5 / 100,
                        child: TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          controller: firstName,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width * 5) / 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Téléphone",
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 100,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 5 / 100,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          controller: phoneNumber,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width * 5) / 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Localisation",
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 100,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 5 / 100,
                            width: MediaQuery.of(context).size.width * 25 / 100,
                            child: TextField(
                              enabled: false,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              controller: latitude,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1 / 100,
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 5 / 100,
                            width: MediaQuery.of(context).size.width * 25 / 100,
                            child: TextField(
                              enabled: false,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              controller: longitude,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1 / 100,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade500,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 2 / 100,
                                    50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0)),
                              ),
                              child: const Icon(Icons.location_on_outlined)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade500,
                      minimumSize: Size(
                          MediaQuery.of(context).size.width * 50 / 100, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                    ),
                    child: const Text("Valider"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 100,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade500,
                      minimumSize: Size(
                          (MediaQuery.of(context).size.width) * 50 / 100, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                    ),
                    child: const Text("Annuler"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
