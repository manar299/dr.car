import 'package:flutter/material.dart';
import 'drawer.dart';

class PrivacyPage extends StatelessWidget {
  static const String route = '/privacy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy'),
      ),
      body: Center(
        child: Text('Privacy Page'),
      ),
    );
  }
}
