import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mylearningapp/screens/list_screen.dart';
import 'package:mylearningapp/providers/theme_provider.dart';
import '../screens/home_screen.dart';
import '../features/profile/screens/myprofile.dart';
import '../screens/settings_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/help_screen.dart';
import '../screens/about_screen.dart';
import '../screens/favorites_screen.dart';

class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  void navigate(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget buildItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget screen,
  ) {
    final bool isSelected = currentRoute == title;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.deepOrange : Colors.black54,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      tileColor: isSelected ? Colors.deepOrange.withOpacity(0.1) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // 🔷 Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.orange],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "user@email.com",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  // 🔹 MAIN
                  sectionTitle("MAIN"),
                  buildItem(context, Icons.home, "Home", HomeScreen()),
                  buildItem(context, Icons.list, "CRUD", ListScreen()),
                  buildItem(
                    context,
                    Icons.favorite,
                    "Favorites",
                    FavoritesScreen(),
                  ),

                  Divider(),

                  // 🔹 ACCOUNT
                  sectionTitle("ACCOUNT"),
                  buildItem(context, Icons.person, "My Profile", Myprofile()),
                  buildItem(
                    context,
                    Icons.notifications,
                    "Notifications",
                    NotificationsScreen(),
                  ),

                  Divider(),

                  // 🔹 APP SETTINGS
                  sectionTitle("APP"),
                  buildItem(
                    context,
                    Icons.settings,
                    "Settings",
                    SettingsScreen(),
                  ),
                  buildItem(
                    context,
                    Icons.help_outline,
                    "Help & Support",
                    HelpScreen(),
                  ),
                  buildItem(
                    context,
                    Icons.info_outline,
                    "About",
                    AboutScreen(),
                  ),

                  Divider(),

                  // � THEME
                  sectionTitle("THEME"),
                  Consumer<ThemeProvider>(
                    builder: (context, themeProvider, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Icon(
                              themeProvider.isDarkMode
                                  ? Icons.dark_mode
                                  : Icons.light_mode,
                              color: themeProvider.isDarkMode
                                  ? Colors.indigo
                                  : Colors.amber,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                themeProvider.isDarkMode
                                    ? "Dark Mode"
                                    : "Light Mode",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Switch(
                              value: themeProvider.isDarkMode,
                              onChanged: (value) {
                                themeProvider.setDarkMode(value);
                              },
                              activeThumbColor: Colors.indigo,
                              inactiveThumbColor: Colors.amber,
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  Divider(),

                  // �🔻 LOGOUT
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text("Logout", style: TextStyle(color: Colors.red)),
                    onTap: () {
                      // Add logout logic
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
