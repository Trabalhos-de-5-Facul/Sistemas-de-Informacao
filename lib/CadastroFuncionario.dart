// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ip.dart';

class SignUpScreenFuncionario extends StatefulWidget {
  final int codigoOng;
  const SignUpScreenFuncionario({
    required this.codigoOng,
  });

  @override
  State<StatefulWidget> createState() => InitState();
}

// ignore: camel_case_types
class registroFunc {
  late String nomeFuncionario, rg, telefone, endereco;
  late int codigoOng, cpf;
  setNomeFuncionario(String nomeFuncionario) {
    this.nomeFuncionario = nomeFuncionario;
  }

  String getNomeFuncionario() {
    return nomeFuncionario;
  }

  setCpfFuncionario(int cpf) {
    this.cpf = cpf;
  }

  int getCpfFuncionario() {
    return cpf;
  }

  setTelefone(String telefone) {
    this.telefone = telefone;
  }

  String getTelefone() {
    return telefone;
  }

  setRG(String rg) {
    this.rg = rg;
  }

  String getRG() {
    return rg;
  }

  setEndereco(String endereco) {
    this.endereco = endereco;
  }

  String getEndereco() {
    return endereco;
  }

  setCodigoOng(int codigo) {
    codigoOng = codigo;
  }

  int getCodigoOng() {
    return codigoOng;
  }
}

registroFunc register = registroFunc();
postFunc() async {
  try {
    await http.post(urlFuncionarios, body: {
      "cpf": register.getCpfFuncionario().toString(),
      "nome": register.getNomeFuncionario(),
      "rg": register.getRG(),
      "telefone": register.getTelefone(),
      "endereco": register.getEndereco(),
      "cod_ong": register.getCodigoOng().toString()
    });
  } catch (e) {
    return e;
  }
}

class InitState extends State<SignUpScreenFuncionario> {
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    register.setCodigoOng(widget.codigoOng);
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
              child: TextField(
                onChanged: (String text) async {
                  register.setNomeFuncionario(text);
                },
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.face,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Nome do Funcionário",
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
                  register.setRG(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "RG",
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
                  register.setCpfFuncionario(int.parse(text));
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
                  register.setTelefone(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.local_phone,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Telefone",
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
                  register.setEndereco(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Endereço",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                postFunc();
                Navigator.popUntil(
                    context,
                    ModalRoute.withName(
                        '/Acesso ONGs')); //vai para esta pagina sem gerar um botão de retorno no appbar
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
