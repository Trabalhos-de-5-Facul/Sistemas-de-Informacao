import 'package:flutter/material.dart';
import 'package:flutter_application_1/CadastroFuncionario.dart';
import 'package:flutter_application_1/acessoOng.dart';
import 'package:http/http.dart' as http;

import 'acessoFuncionario.dart';

class MyDetails extends StatefulWidget {
  final Ong ongs;
  const MyDetails({required this.ongs});
  @override
  _MyDetailsState createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    void deleteUser() async {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da ONG'),
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
                  widget.ongs.nome,
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
                          Text('Código'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Diretor(a)'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Bairro'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Rua'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Número'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Cidade'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Estado'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('CEP'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.ongs.codOng}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.ongs.nomeDiretora),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.ongs.bairro),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.ongs.rua),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('${widget.ongs.numero}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.ongs.cidade),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.ongs.estado),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.ongs.cep),
                        ],
                      )
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AcessoFuncionario()));
                      },
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 17, 101, 48)),
                        child: const Center(
                          child: Text('Funcionários',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              )),
                        ),
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AcessoFuncionario()));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
