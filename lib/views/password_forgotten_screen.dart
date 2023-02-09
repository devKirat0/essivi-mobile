
import 'package:essivi_sarl_final/statics/static_attributs.dart';
import 'package:essivi_sarl_final/statics/widget.dart';
import 'package:flutter/material.dart';

class PasswordForgotScreen extends StatefulWidget{
  const PasswordForgotScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PasswordForgotScreenState();

}

class _PasswordForgotScreenState extends State<PasswordForgotScreen>{
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(Statics.textEnterprise),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyWidget().textWidget(15, 30),
            MyWidget().inputWidget(15, 30, 'Nom d\'utilisateur',_usernameController),
            MyWidget().validate(context,_usernameController),
          ],
        ),
      ),
    );
  }

}