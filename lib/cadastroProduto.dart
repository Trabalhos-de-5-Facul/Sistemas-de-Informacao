// ignore_for_file: file_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ip.dart';
import 'dart:typed_data';

class SignUpScreenProduct extends StatefulWidget {
  const SignUpScreenProduct({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

// ignore: camel_case_types
class registroProduto {
  late int codProduto;
  late bool perecivel = true;
  late String nome, fornecedor, lote;
  /*int getCodProduto() => codProduto;
  setCodProduto(int codProduto) => this.codProduto = codProduto;
  */
  bool getPerecivel() => perecivel;
  setPerecivel(bool perecivel) => this.perecivel = perecivel;
  String getNome() => nome;
  setNome(String nome) => this.nome = nome;
  String getFornecedor() => fornecedor;
  setFornecedor(String fornecedor) => this.fornecedor = fornecedor;
  String getLote() => lote;
  setLote(String lote) => this.lote = lote;
}

registroProduto register = registroProduto();
postProduto() async {
  final String perecivel;
  if (register.perecivel) {
    perecivel = '1';
  } else {
    perecivel = '';
  }
  print(perecivel);
  try {
    var response = await http.post(urlProdutos, body: {
      'Nome': register.getNome(),
      'Fornecedor': register.getFornecedor(),
      'Lote': register.getLote(),
      'Perecivel': perecivel,
    });
    print(response.body);
  } catch (e) {
    print(e);
  }
}

class InitState extends State<SignUpScreenProduct> {
  @override
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
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
              /*child: TextField(
                onChanged: (String codigoProduto) async {
                  register.setCodProduto(int.parse(
                      codigoProduto)); //pensar em como fazer isso não bugar
                },
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.code,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Código do Produto",
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
              ),*/
              child: TextField(
                onChanged: (String text) async {
                  register.setNome(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.featured_play_list,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Nome",
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
                onChanged: (text) async {
                  register.setFornecedor(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.store_mall_directory,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Fornecedor",
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
                  register.setLote(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.local_shipping,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Lote",
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
              child: SwitchListTile(
                title: const Text(
                  'Perecível',
                ),
                value: register.getPerecivel(),
                onChanged: (bool value) {
                  setState(() {
                    register.setPerecivel(value);
                  });
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                postProduto();
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/Hub Admin',
                    (route) =>
                        false); //vai para esta pagina sem gerar um botão de retorno no appbar
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
          ],
        )));
  }
}
