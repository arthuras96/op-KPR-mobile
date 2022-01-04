import 'package:flutter/material.dart';
import 'package:remote_lobby/services/login.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    //image: AssetImage('assets/images/cover.jpg'))),
                    image: AssetImage('assets/logo.png'))),
          ),
          ListTile(
            leading: Icon(Icons.videocam),
            title: Text('Monitoramento'),
            onTap: () => {Navigator.pushNamed(context, '/default')},
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text('QRCode'),
            onTap: () => {Navigator.pushNamed(context, '/qrcode')},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => {logout(context)},
          ),
        ],
      ),
    );
  }

  void logout(context) async {
    LoginApi loginApi = new LoginApi();
    bool logoutOk = await loginApi.logout();
    if (logoutOk) {
      Navigator.pushNamed(context, '/');
    }
  }
}
