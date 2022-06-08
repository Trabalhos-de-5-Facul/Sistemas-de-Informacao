import 'package:flutter/material.dart';
import 'package:flutter_application_1/Hub.dart';
import 'package:flutter_application_1/acessoMotorista.dart';
import 'package:flutter_application_1/acessoOng.dart';
import 'package:flutter_application_1/acessoProdutos.dart';
import 'package:flutter_application_1/cadastro.dart';
import 'package:flutter_application_1/cadastroMotorista.dart';
import 'package:flutter_application_1/cadastroProduto.dart';
import 'package:flutter_application_1/gerarRomaneio.dart';
import 'package:flutter_application_1/login.dart';
import 'package:overlay_support/overlay_support.dart';
import 'acessoFuncionario.dart';
import 'gerarRomaneio_final.dart';

void main() {
  runApp(OverlaySupport.global(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Distribuição alimentos",
    initialRoute: '/Login',
    routes: {
      '/Cadastro': (context) => const SignUpScreen(),
      '/Hub Admin': (context) => const HubAdmin(),
      '/Cadastro Motorista': (context) => const SignUpScreenDriver(),
      '/Cadastro Produto': (context) => const SignUpScreenProduct(),
      '/Acesso ONGs': (context) => const AcessoONG(),
      '/Acesso Produtos': (context) => const AcessoProdutos(),
      '/Gerar Romaneio': (context) => const GerarRomaneio(),
      '/Login': (context) => const Login(),
      '/Acesso Funcionario': (context) => const AcessoFuncionario(
            codOng: null,
          ),
      '/Acesso Motoristas': (context) => const AcessoMotorista()
    },
  )));
}
