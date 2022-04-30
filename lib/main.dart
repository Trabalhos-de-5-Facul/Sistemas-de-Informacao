import 'package:flutter/material.dart';
import 'package:flutter_application_1/Hub.dart';
import 'package:flutter_application_1/acessoOng.dart';
import 'package:flutter_application_1/acessoProdutos.dart';
import 'package:flutter_application_1/cadastro.dart';
import 'package:flutter_application_1/cadastroMotorista.dart';
import 'package:flutter_application_1/cadastroProduto.dart';
import 'package:flutter_application_1/gerarRomaneio.dart';
import 'package:flutter_application_1/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Distribuição alimentos",
    initialRoute: '/Hub Admin',
    routes: {
      '/Cadastro': (context) => const SignUpScreen(),
      '/Hub Admin': (context) => const HubAdmin(),
      '/Cadastro Motorista': (context) => const SignUpScreenDriver(),
      '/Cadastro Produto': (context) => const SignUpScreenProduct(),
      '/Acesso ONGs': (context) => const acessoONG(),
      '/Acesso Produtos': (context) => const acessoProdutos(),
      '/Gerar Romaneio': (context) => const gerarRomaneio(),
      '/Login': (context) => const login(),
    },
  ));
}
