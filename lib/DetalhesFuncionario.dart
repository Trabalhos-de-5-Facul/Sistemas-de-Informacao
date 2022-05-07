import 'package:flutter/material.dart';
import 'package:flutter_application_1/CadastroFuncionario.dart';
import 'package:flutter_application_1/acessoFuncionario.dart';
import 'package:http/http.dart' as http;

class MyDetailsFunc extends StatefulWidget {
  final Funcionario funcionarios;
  const MyDetailsFunc({required this.funcionarios});
  @override
  _MyDetailsState createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetailsFunc> {
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
                  widget.funcionarios.nome,
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
                            Text('Código da ONG'),
                            SizedBox(
                              height: 10,
                            ),
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
                            Text('${widget.funcionarios.codOng}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.funcionarios.rg),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${widget.funcionarios.cpf}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.funcionarios.telefone),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.funcionarios.endereco),
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
                      deleteUser();
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
