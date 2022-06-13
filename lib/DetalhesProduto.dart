// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/acessoProdutos.dart';
import 'package:flutter_application_1/ip.dart';
import 'package:http/http.dart' as http;
import 'Hub.dart';

class MyDetailsProd extends StatefulWidget {
  final Produto produto;
  const MyDetailsProd({required this.produto});
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
      Navigator.of(context).popUntil(ModalRoute.withName('/Acesso Produtos'));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirmação de deleção"),
    content: Text("Tem certeza que deseja deletar o produto?"),
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
    await http.delete(urlProdutos, body: {"cod_produto": codigo.toString()});
  } catch (e) {
    return (e);
  }
}

class _MyDetailsState extends State<MyDetailsProd> {
  @override
  Widget build(BuildContext context) {
    String perecivel;
    if (widget.produto.perecivel) {
      perecivel = "Sim";
    } else {
      perecivel = "Não";
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes do Produto'),
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 17, 101, 48),
        ),
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: Center(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
                child: Column(children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.indigo[700],
                    child: Center(
                        child: Text(
                      widget.produto.nome,
                      style: const TextStyle(color: Color(0xffFFFFFF)),
                    )),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 32),
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
                              Text('Fornecedor'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Lote'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Perecível ?'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.produto.codProduto}'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(widget.produto.fornecedor),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(widget.produto.lote),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(perecivel),
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
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HubAdmin()));
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
                          showAlertDialog(context, widget.produto.codProduto);
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
                ]))));
  }
}
