import 'package:flutter/material.dart';
import 'package:remote_lobby/widgets/nav-drawer.dart';

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  @override
  // void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Emitir QRCode'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text('Emitir QRCode'),
      ),
    );
  }
}
