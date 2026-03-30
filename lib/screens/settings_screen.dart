import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(currentRoute: "Settings"),
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("Settings Screen")),
    );
  }
}
