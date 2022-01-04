import 'package:remote_lobby/pages/home.page.dart';
import 'package:remote_lobby/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:remote_lobby/pages/qrcode.page.dart';
import 'package:remote_lobby/pages/reset-password.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KPR Lobby',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/default': (context) => HomePage(),
        '/qrcode': (context) => QRCodePage(),
        '/reset-password': (context) => ResetPasswordPage(),
      },
    );
  }
}
