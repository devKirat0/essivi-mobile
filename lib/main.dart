import 'dart:ui';

import 'package:flutter/material.dart';
import 'statics/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low
        )
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      MyWidget().imageEssivi(context,15, 10),
                      MyWidget().textEssivi("AGENT"),
                      MyWidget().textEssivi("ESSIVI-SARL"),
                      MyWidget().usernameInputWidget(15, 10,  "Nom d'utilisateur",_usernameController),
                      MyWidget().passwordInputWidget(15, 0, "Mot de passe",_passwordController),
                      MyWidget().textButtonWidget(15,15,context),
                      MyWidget().login(_usernameController,_passwordController,context)
                    ],
                  ),
                )
              ],
            ),
          )
          ),
      ),
    );
  }
}
