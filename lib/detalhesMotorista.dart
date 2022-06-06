// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/acessoFuncionario.dart';
import 'package:flutter_application_1/acessoMotorista.dart';
import 'package:flutter_application_1/ip.dart';
import 'package:http/http.dart' as http;

class MyDetailsMotorista extends StatefulWidget {
  final Motorista motorista;
  const MyDetailsMotorista({required this.motorista});
  @override
  _MyDetailsState createState() => _MyDetailsState();
}

showAlertDialog(BuildContext context, int? codigo) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = ElevatedButton(
    child: Text("Continuar"),
    onPressed: () async {
      await deleteUser(codigo);
      Navigator.of(context).popUntil(
        ModalRoute.withName("/Acesso Motoristas"),
      );
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirmação de deleção"),
    content: Text("Tem certeza que deseja deletar o motorista?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

deleteUser(int? codigo) async {
  try {
    print("oi");
    var response =
        await http.delete(urlMotoristas, body: {"cpf": codigo.toString()});
  } catch (e) {
    print(e);
  }
}

class _MyDetailsState extends State<MyDetailsMotorista> {
  @override
  Widget build(BuildContext context) {
    void deleteUser() async {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes de Funcionário'),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 17, 101, 48),
      ),
      backgroundColor: const Color.fromARGB(255, 177, 216, 183),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
          child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.indigo[700],
                child: Center(
                    child: Text(
                  widget.motorista.nome,
                  style: const TextStyle(color: Color(0xffFFFFFF)),
                )),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('RG'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('CPF'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Telefone'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Endereço'),
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.motorista.rg),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${widget.motorista.cpf}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.motorista.telefone),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.motorista.endereco),
                          ])
                    ],
                  ),
                ),
                // height: 455 ,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 177, 216, 183),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1),
                      ),
                    ]),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => AcessoFuncionario(
                                    codOng: null,
                                  )));
                    },
                    child: Container(
                      height: 25,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 17, 101, 48)),
                      child: const Center(
                        child: Text('Edit',
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                            )),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      showAlertDialog(context, widget.motorista.cpf);
                    },
                    child: Container(
                      height: 25,
                      width: 70,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 17, 101, 48)),
                      child: const Center(
                        child: Text('Delete',
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                            )),
                      ),
                    )),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
