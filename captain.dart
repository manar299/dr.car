import 'main.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'home.dart';

class CaptainPage extends StatelessWidget {
  static const String route = '/captain';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Captain Portal'),
      ),
      body: Center(
        child: Text('Captain Portal Page'),
      ),
    );
  }
}
