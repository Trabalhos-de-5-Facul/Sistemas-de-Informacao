///  ignore_for_file: unused_local_variable

// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/gerarRomaneio_final.dart';
import 'package:http/http.dart' as http;

import 'ip.dart';

class GerarRomaneio extends StatefulWidget {
  const GerarRomaneio({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

// ignore: camel_case_types
class registroRomaneio {
  late int numero, cpf, codigoOng;

  setNumeroRomaneio(int numero) {
    this.numero = numero;
  }

  int getNumeroRomaneio() {
    return numero;
  }

  setCpfMotorista(int cpf) {
    this.cpf = cpf;
  }

  int getCpfMotorista() {
    return cpf;
  }

  setCodigoOng(int codigo) {
    codigoOng = codigo;
  }

  int getCodigoOng() {
    return codigoOng;
  }
}

registroRomaneio register = registroRomaneio();

class InitState extends State<GerarRomaneio> {
  @override
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
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
                register.setNumeroRomaneio(int.parse(text));
              },
              cursorColor: const Color(0xffF5591F),
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.numbers,
                  color: Color.fromARGB(255, 4, 197, 52),
                ),
                hintText: "Número do Romaneio",
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
                register.setCodigoOng(int.parse(text));
              },
              cursorColor: const Color.fromARGB(0, 4, 197, 52),
              decoration: const InputDecoration(
                focusColor: Color.fromARGB(0, 4, 197, 52),
                icon: Icon(
                  Icons.code,
                  color: Color.fromARGB(255, 4, 197, 52),
                ),
                hintText: "Código Ong",
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
                register.setCpfMotorista(int.parse(text));
              },
              cursorColor: const Color.fromARGB(0, 4, 197, 52),
              decoration: const InputDecoration(
                focusColor: Color.fromARGB(0, 4, 197, 52),
                icon: Icon(
                  Icons.assignment_rounded,
                  color: Color.fromARGB(255, 4, 197, 52),
                ),
                hintText: "CPF",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => GerarRomaneioFinal(
                            romaneio: register,
                          ))).then((_) => setState(
                  () {})); //vai para esta pagina sem gerar um botão de retorno no appbar
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
