// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ip.dart';
import 'package:http/http.dart' as http;

class SignUpScreenDriver extends StatefulWidget {
  const SignUpScreenDriver({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

// ignore: camel_case_types
class registroMotorista {
  late String nomeMotorista, cpfMotorista, telefone, rg, endereco, senha;

  setNomeMotorista(String nomeMotorista) {
    this.nomeMotorista = nomeMotorista;
  }

  String getNomeMotorista() {
    return nomeMotorista;
  }

  setCpfMotorista(String cpfMotorista) {
    this.cpfMotorista = cpfMotorista;
  }

  String getCpfMotorista() {
    return cpfMotorista;
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

  setSenha(String senha) {
    this.senha = senha;
  }

  String getSenha() {
    return senha;
  }
}

registroMotorista register = registroMotorista();
postMotorista() async {
  try {
    await http.post(urlMotoristas, body: {
      'nome': register.getNomeMotorista(),
      'rg': register.getRG(),
      'cpf': register.getCpfMotorista(),
      'telefone': register.getTelefone(),
      'endereco': register.getEndereco()
    });
  } catch (e) {
    return (e);
  }
}

class InitState extends State<SignUpScreenDriver> {
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
              child: TextField(
                onChanged: (String text) async {
                  register.setNomeMotorista(text);
                },
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.face,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Nome do Motorista",
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
                  register.setCpfMotorista(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.person,
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
                  register.setRG(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.assignment_rounded,
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
            // Container(
            //   alignment: Alignment.center,
            //   margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   height: 54,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //     color: const Color(0xffEEEEEE),
            //     boxShadow: const [
            //       BoxShadow(
            //           offset: Offset(0, 20),
            //           blurRadius: 100,
            //           color: Color.fromARGB(255, 17, 101, 48)),
            //     ],
            //   ),
            //   child: TextField(
            //     onChanged: (String text) async {
            //       register.setSenha(text);
            //     },
            //     cursorColor: const Color.fromARGB(0, 4, 197, 52),
            //     decoration: const InputDecoration(
            //       focusColor: Color.fromARGB(0, 4, 197, 52),
            //       icon: Icon(
            //         Icons.lock,
            //         color: Color.fromARGB(255, 4, 197, 52),
            //       ),
            //       hintText: "Senha",
            //       enabledBorder: InputBorder.none,
            //       focusedBorder: InputBorder.none,
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                postMotorista();
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/Hub Admin'),
                ); //vai para esta pagina sem gerar um botão de retorno no appbar
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
