import 'package:flutter/material.dart';
import 'package:remote_lobby/widgets/nav-drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Monitoramento'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text('Monitoramento'),
      ),
    );
  }
}
