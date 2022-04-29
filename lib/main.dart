import 'package:flutter/material.dart';
import 'package:flutter_application_1/Hub.dart';
import 'package:flutter_application_1/cadastro.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Distribuição alimentos",
    initialRoute: '/Hub Admin',
    routes: {
      '/Cadastro': (context) => const SignUpScreen(),
      '/Hub Admin': (context) => const HubAdmin()
    },
  ));
}
