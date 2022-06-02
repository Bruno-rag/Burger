
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testefirebase/appBar.page.dart';
import 'package:testefirebase/Home/home.page.dart';
import '../AcessoApp/loginDemo.page.dart';
import '../services/auth.service.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => AuthCheckState();
}

class AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return  LoginPage();
    } else {
      return  AppBarPage();
    }
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
