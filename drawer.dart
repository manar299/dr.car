import 'captain.dart';
import 'package:drcar/my_header_drawer.dart';
import 'package:drcar/privacy.dart';
import 'package:drcar/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Navigation',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),

      // ...
      routes: {
        "/captain": (context) => CaptainPage(),
        "/settings": (context) => SettingsPage(),
        "/privacy": (context) => PrivacyPage(),
        "/logout": (context) => LogoutPage(),
      },
      // ...
    );
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(63, 182, 193, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 40,
                  backgroundImage: AssetImage(
                    'images/logoImage.png',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Captain Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '093456788',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_box,
              color: Color.fromRGBO(63, 182, 193, 1),
              size: 28,
            ),
            title: Text(
              'Captain Portal',
              style: TextStyle(
                color: Color.fromRGBO(63, 182, 193, 1),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/captain');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color.fromRGBO(63, 182, 193, 1),
              size: 28,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Color.fromRGBO(63, 182, 193, 1),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.security,
              color: Color.fromRGBO(62, 182, 192, 1),
              size: 28,
            ),
            title: Text(
              'Privacy',
              style: TextStyle(
                color: Color.fromRGBO(62, 182, 193, 1),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/privacy');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Color.fromRGBO(62, 182, 192, 1),
              size: 28,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Color.fromRGBO(62, 182, 193, 1),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/logout');
            },
          ),
        ],
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  static const String route = '/logout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: Text('Logout Page'),
      ),
    );
  }
}
