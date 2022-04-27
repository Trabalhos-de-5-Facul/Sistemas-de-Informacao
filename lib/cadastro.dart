import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 177, 216, 183),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Color.fromARGB(0, 4, 197, 52),
                gradient: LinearGradient(
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
                    margin: EdgeInsets.only(top: 50),
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
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
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.assignment,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Nome da ONG",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color.fromARGB(255, 17, 101, 48)),
                ],
              ),
              child: TextField(
                cursorColor: Color.fromARGB(0, 4, 197, 52),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.face,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Nome da Diretora",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color.fromARGB(255, 17, 101, 48)),
                ],
              ),
              child: TextField(
                cursorColor: Color.fromARGB(0, 4, 197, 52),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.house,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Rua",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color.fromARGB(255, 17, 101, 48)),
                ],
              ),
              child: TextField(
                cursorColor: Color.fromARGB(0, 4, 197, 52),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.pin,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Número",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color.fromARGB(255, 17, 101, 48)),
                ],
              ),
              child: TextField(
                cursorColor: Color.fromARGB(0, 4, 197, 52),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.add_circle,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Bairro",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color.fromARGB(255, 17, 101, 48)),
                ],
              ),
              child: TextField(
                cursorColor: Color.fromARGB(0, 4, 197, 52),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.place,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Cidade",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color.fromARGB(255, 17, 101, 48)),
                ],
              ),
              child: TextField(
                cursorColor: Color.fromARGB(0, 4, 197, 52),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.streetview,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "Estado",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color.fromARGB(255, 17, 101, 48)),
                ],
              ),
              child: TextField(
                cursorColor: Color.fromARGB(0, 4, 197, 52),
                decoration: InputDecoration(
                  focusColor: Color.fromARGB(0, 4, 197, 52),
                  icon: Icon(
                    Icons.gps_fixed,
                    color: Color.fromARGB(255, 4, 197, 52),
                  ),
                  hintText: "CEP",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color.fromARGB(255, 17, 101, 48)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Write Click Listener Code Here.
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 900, right: 900, bottom: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    (new Color.fromARGB(255, 238, 238, 238)),
                    Color.fromARGB(255, 238, 238, 238)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                ),
                child: Text(
                  "REGISTER",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        )));
  }
}
