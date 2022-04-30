import 'package:flutter/material.dart';

class acessoProdutos extends StatefulWidget {
  const acessoProdutos({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<acessoProdutos> {
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 177, 216, 183),
    );
  }
}
