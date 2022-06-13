import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Login> {
  late String usuario;
  late String senha;
  @override
  Widget build(BuildContext context) => initWidget();
  Widget initWidget() {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 177, 216, 183),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Color.fromARGB(255, 40, 136, 107),
                gradient: LinearGradient(
                  colors: [
                    (Color.fromARGB(255, 40, 136, 107)),
                    Color.fromARGB(255, 17, 101, 48),
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
                    margin: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      "images/icone-utilisateur-vert.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
                ],
              )),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 150),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
              ),
              child: TextField(
                onChanged: (String text) async {
                  usuario = text;
                },
                cursorColor: const Color.fromARGB(255, 40, 136, 107),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 40, 136, 107),
                  ),
                  hintText: "Login",
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
                color: Colors.grey[200],
              ),
              child: TextField(
                onChanged: (String text) async {
                  senha = text;
                },
                cursorColor: const Color.fromARGB(255, 40, 136, 107),
                decoration: const InputDecoration(
                  focusColor: Color.fromARGB(255, 40, 136, 107),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color.fromARGB(255, 40, 136, 107),
                  ),
                  hintText: "Senha",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Hub Admin');
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 200),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    (Color.fromARGB(255, 40, 136, 107)),
                    Color.fromARGB(255, 17, 101, 48),
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                ),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )));
  }
}
