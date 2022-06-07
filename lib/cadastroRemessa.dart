///  ignore_for_file: unused_local_variable

// ignore_for_file: unused_import, file_names, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_application_1/gerarRomaneio_final.dart';
import 'package:http/http.dart' as http;

import 'ip.dart';

class cadastroRemessa extends StatefulWidget {
  final codProduto;
  const cadastroRemessa({required this.codProduto});

  @override
  State<StatefulWidget> createState() => InitState();
}

class registroRemessa {
  late int quantidade;
  late String data;
  late int codProduto;
  setQuantidadeRemessa(int quantidade) {
    this.quantidade = quantidade;
  }

  int getQuantidadeRemessa() {
    return quantidade;
  }

  setdataValidade(String data) {
    this.data = data;
  }

  String getdataValidade() {
    return data;
  }

  int getCodProdutos() {
    return codProduto;
  }

  setcodProduto(int cod) {
    codProduto = cod;
  }
}

registroRemessa register = registroRemessa();
postRemessa() async {
  try {
    await http.post(urlRemessas, body: {
      "quantidade": register.getQuantidadeRemessa().toString(),
      "data": register.getdataValidade().toString(),
    });
  } catch (e) {
    return e;
  }
}

class InitState extends State<cadastroRemessa> {
  @override
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
    register.setcodProduto(widget.codProduto);
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
              color: Color.fromARGB(0, 4, 197, 52),
              gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  (Color.fromARGB(255, 40, 136, 107)),
                  Color.fromARGB(255, 9, 175, 147)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "images/logo_ceasa.png",
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            )),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color.fromARGB(255, 17, 101, 48)),
              ],
            ),
            child: TextField(
              onChanged: (String text) async {
                register.setQuantidadeRemessa(int.parse(text));
              },
              cursorColor: const Color(0xffF5591F),
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.numbers,
                  color: Color.fromARGB(255, 4, 197, 52),
                ),
                hintText: "Quantidade",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffEEEEEE),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color.fromARGB(255, 17, 101, 48)),
              ],
            ),
            child: TextField(
              onChanged: (String text) async {
                register.setdataValidade(text);
              },
              cursorColor: const Color.fromARGB(0, 4, 197, 52),
              decoration: const InputDecoration(
                focusColor: Color.fromARGB(0, 4, 197, 52),
                icon: Icon(
                  Icons.food_bank,
                  color: Color.fromARGB(255, 4, 197, 52),
                ),
                hintText: "Data de Validade",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              postRemessa();
              Navigator.pop(context, register);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.35,
                  vertical: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                // ignore: prefer_const_literals_to_create_immutables
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
              ),
              child: const Text(
                "CADASTRAR",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ])));
  }
}
