import 'package:flutter/material.dart';
import 'package:mylearningapp/screens/home_screen.dart';
import '../widgets/app_drawer.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Toggle states
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = false;
  bool _twoFactorAuth = false;
  bool _biometricLogin = true;
  bool _dataSharing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(currentRoute: "Settings"),
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Settings Card
            _buildSettingsCard(
              context,
              title: "Account Settings",
              icon: Icons.account_circle,
              iconColor: Colors.blue,
              children: [
                _buildSettingsTile(
                  context,
                  icon: Icons.person,
                  title: "Full Name",
                  subtitle: "John Doe",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.email,
                  title: "Email Address",
                  subtitle: "john.doe@email.com",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.phone,
                  title: "Phone Number",
                  subtitle: "+1 (555) 123-4567",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.cake,
                  title: "Date of Birth",
                  subtitle: "January 15, 1990",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Notification Settings Card
            _buildSettingsCard(
              context,
              title: "Notifications",
              icon: Icons.notifications,
              iconColor: Colors.green,
              children: [
                _buildToggleTile(
                  context,
                  icon: Icons.notifications_active,
                  title: "Enable All Notifications",
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() => _notificationsEnabled = value);
                  },
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildToggleTile(
                  context,
                  icon: Icons.mail_outline,
                  title: "Email Notifications",
                  value: _emailNotifications,
                  onChanged: (value) {
                    setState(() => _emailNotifications = value);
                  },
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildToggleTile(
                  context,
                  icon: Icons.notifications_none,
                  title: "Push Notifications",
                  value: _pushNotifications,
                  onChanged: (value) {
                    setState(() => _pushNotifications = value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Privacy & Security Card
            _buildSettingsCard(
              context,
              title: "Privacy & Security",
              icon: Icons.security,
              iconColor: Colors.orange,
              children: [
                _buildToggleTile(
                  context,
                  icon: Icons.fingerprint,
                  title: "Biometric Login",
                  value: _biometricLogin,
                  onChanged: (value) {
                    setState(() => _biometricLogin = value);
                  },
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildToggleTile(
                  context,
                  icon: Icons.security_update,
                  title: "Two-Factor Authentication",
                  value: _twoFactorAuth,
                  onChanged: (value) {
                    setState(() => _twoFactorAuth = value);
                  },
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.vpn_key,
                  title: "Change Password",
                  subtitle: "Update your password regularly",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildToggleTile(
                  context,
                  icon: Icons.share,
                  title: "Data Sharing",
                  value: _dataSharing,
                  onChanged: (value) {
                    setState(() => _dataSharing = value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // App Preferences Card
            _buildSettingsCard(
              context,
              title: "App Preferences",
              icon: Icons.tune,
              iconColor: Colors.purple,
              children: [
                _buildSettingsTile(
                  context,
                  icon: Icons.language,
                  title: "Language",
                  subtitle: "English (US)",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.text_fields,
                  title: "Font Size",
                  subtitle: "Medium",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.storage,
                  title: "App Cache",
                  subtitle: "Clear Cache",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cache cleared successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // About & Support Card
            _buildSettingsCard(
              context,
              title: "About & Support",
              icon: Icons.info_outline,
              iconColor: Colors.red,
              children: [
                _buildSettingsTile(
                  context,
                  icon: Icons.info,
                  title: "App Version",
                  subtitle: "1.0.0",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.help_outline,
                  title: "Help & Support",
                  subtitle: "Get help and report issues",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.description,
                  title: "Privacy Policy",
                  subtitle: "Read our privacy terms",
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildSettingsTile(
                  context,
                  icon: Icons.balance,
                  title: "Terms & Conditions",
                  subtitle: "Review our terms",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Danger Zone Card
            _buildSettingsCard(
              context,
              title: "Danger Zone",
              icon: Icons.warning,
              iconColor: Colors.red,
              children: [
                _buildActionTile(
                  context,
                  icon: Icons.delete_outline,
                  title: "Clear All Data",
                  subtitle: "This action cannot be undone",
                  color: Colors.orange,
                  onTap: () {},
                ),
                Divider(height: 1, color: Colors.grey[300]),
                _buildActionTile(
                  context,
                  icon: Icons.logout,
                  title: "Logout",
                  subtitle: "Sign out of your account",
                  color: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<Widget> children,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Card Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Card Content
          ...children,
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepOrange, size: 22),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }

  Widget _buildToggleTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepOrange, size: 22),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Colors.indigo,
        inactiveThumbColor: Colors.amber,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }

  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color, size: 22),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: color,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      trailing: Icon(Icons.chevron_right, color: color),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }
}
