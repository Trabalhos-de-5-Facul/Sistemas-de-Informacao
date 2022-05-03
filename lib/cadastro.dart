import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

// ignore: camel_case_types
class registro {
  late int numero, cep;
  late String nomeOng, nomeDiretora, rua, bairro, cidade, estado;

  setNumero(int numero) {
    this.numero = numero;
  }

  int getNumero() {
    return numero;
  }

  setCep(int cep) {
    this.cep = cep;
  }

  int getCep() {
    return cep;
  }

  setNomeOng(String nomeOng) {
    this.nomeOng = nomeOng;
  }

  String getNomeOng() {
    return nomeOng;
  }

  setNomeDiretora(String nomeDiretora) {
    this.nomeDiretora = nomeDiretora;
  }

  String getNomeDiretora() {
    return nomeDiretora;
  }

  setRua(String rua) {
    this.rua = rua;
  }

  String getRua() {
    return rua;
  }

  setBairro(String bairro) {
    this.bairro = bairro;
  }

  String getBairro() {
    return bairro;
  }

  setCidade(String cidade) {
    this.cidade = cidade;
  }

  String getCidade() {
    return cidade;
  }

  setEstado(String estado) {
    this.estado = estado;
  }

  String getEstado() {
    return estado;
  }
}

registro register = registro();

postOng() async {
  var url = Uri.parse("http://192.168.15.59:3000/ongs");
  try {
    var response = await http.post(url, body: {
      'nome': register.getNomeOng(),
      'rua': register.getRua(),
      'numero': register.getNumero().toString(),
      'bairro': register.getBairro(),
      'cidade': register.getCidade(),
      'estado': register.getEstado(),
      'cep': register.getCep().toString(),
      'nome_diretora': register.getNomeDiretora()
    });
    print(response.body);
  } catch (e) {
    print(e);
  }
}

class InitState extends State<SignUpScreen> {
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
                  register.setNomeOng(text);
                },
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
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
                  register.setNomeDiretora(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
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
                  register.setRua(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
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
                onChanged: (text) async {
                  register.setNumero(int.parse(text));
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
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
                  register.setBairro(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
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
                  register.setCidade(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
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
                  register.setEstado(text);
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
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
                  register.setCep(int.parse(text));
                },
                cursorColor: const Color.fromARGB(0, 4, 197, 52),
                decoration: const InputDecoration(
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
            GestureDetector(
              onTap: () {
                postOng();
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/Hub Admin',
                    (route) =>
                        false); //vai para esta pagina sem gerar um botão de retorno no appbar
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
