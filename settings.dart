import 'package:flutter/material.dart';
import 'captain.dart';
import 'drawer.dart';

class SettingsPage extends StatelessWidget {
  static const String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
