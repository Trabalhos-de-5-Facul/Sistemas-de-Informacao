import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<login> {
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 177, 216, 183),
    );
  }
}
