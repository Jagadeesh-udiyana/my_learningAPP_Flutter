import 'package:flutter/material.dart';
import 'package:mylearningapp/screens/list_screen.dart';
import '../screens/home_screen.dart';
import '../features/profile/screens/myprofile.dart';
import '../screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  void navigate(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  Widget buildItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget screen,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: currentRoute == title,
      onTap: () => navigate(context, screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text("My App Menu", style: TextStyle(fontSize: 20)),
            ),
          ),

          buildItem(context, Icons.home, "Home", HomeScreen()),
          buildItem(context, Icons.person, "My Profile", Myprofile()),
          buildItem(context, Icons.list, "CRUD", ListScreen()),
          buildItem(context, Icons.settings, "Settings", SettingsScreen()),
        ],
      ),
    );
  }
}
