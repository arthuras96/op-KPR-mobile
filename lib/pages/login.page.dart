import 'package:flutter/material.dart';
import 'package:remote_lobby/services/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initState() {
    super.initState();
    isLoggedIn();
  }

  final controlUsername = TextEditingController();

  final controlPassword = TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void isLoggedIn() async {
    LoginApi loginApi = new LoginApi();
    bool isLoggedIn = await loginApi.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushNamed(context, '/default');
    }
  }

  void sendForm(BuildContext context) async {
    EasyLoading.show(status: 'Carregando...');
    String username = controlUsername.text;
    String password = controlPassword.text;

    if (username == "" || password == "") {
      final snackBar =
          SnackBar(content: Text('Preencha os campos para continuar.'));
      scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    }

    LoginApi loginApi = new LoginApi();
    var response = await loginApi.login(username, password);
    EasyLoading.dismiss();

    if (response) {
      Navigator.pushNamed(context, '/default');
    } else {
      final snackBar = SnackBar(
          content: Text('Dados invalidados. Por favor, tente novamente.'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail ou usuário",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              controller: controlUsername,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              controller: controlPassword,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/reset-password');
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(4284955319),
                    Color(4283510184),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onPressed: () {
                    sendForm(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
