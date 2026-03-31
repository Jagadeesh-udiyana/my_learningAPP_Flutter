import 'package:flutter/material.dart';
import 'package:mylearningapp/screens/home_screen.dart';
import '../widgets/app_drawer.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationItem> notifications = [
    NotificationItem(
      id: 1,
      title: "New Order Received",
      description: "Order #12345 has been placed successfully",
      icon: Icons.shopping_bag,
      color: Colors.blue,
      timestamp: "2 hours ago",
      isRead: false,
    ),
    NotificationItem(
      id: 2,
      title: "Payment Confirmed",
      description: "Your payment of \$299.99 has been confirmed",
      icon: Icons.check_circle,
      color: Colors.green,
      timestamp: "4 hours ago",
      isRead: false,
    ),
    NotificationItem(
      id: 3,
      title: "Shipment on the way",
      description: "Your order is on the way. Track it now!",
      icon: Icons.local_shipping,
      color: Colors.orange,
      timestamp: "6 hours ago",
      isRead: true,
    ),
    NotificationItem(
      id: 4,
      title: "Account Updated",
      description: "Your profile information has been updated",
      icon: Icons.account_circle,
      color: Colors.purple,
      timestamp: "1 day ago",
      isRead: true,
    ),
    NotificationItem(
      id: 5,
      title: "New Message",
      description: "You have a new message from Support Team",
      icon: Icons.mail,
      color: Colors.red,
      timestamp: "2 days ago",
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(currentRoute: "Notifications"),
      appBar: AppBar(
        title: const Text("Notifications"),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {
              setState(() {
                for (var notification in notifications) {
                  notification.isRead = true;
                }
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All notifications marked as read'),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Card
            _buildStatsCard(context),
            const SizedBox(height: 20),

            // Notifications Section
            const Text(
              "Recent Notifications",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return _buildNotificationTile(
                  context,
                  notifications[index],
                  index,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context) {
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final unreadCount = notifications.where((n) => !n.isRead).length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepOrange, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                notifications.length.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Total",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          Container(height: 40, width: 1, color: Colors.white30),
          Column(
            children: [
              Text(
                unreadCount.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Unread",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          Container(height: 40, width: 1, color: Colors.white30),
          Column(
            children: [
              Text(
                (notifications.length - unreadCount).toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Read",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(
    BuildContext context,
    NotificationItem notification,
    int index,
  ) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: notification.isRead
            ? null
            : notification.color.withOpacity(0.05),
        border: Border.all(
          color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: notification.color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(notification.icon, color: notification.color, size: 24),
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 6),
            Text(
              notification.timestamp,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
        trailing: Column(
          children: [
            if (!notification.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: notification.color,
                  shape: BoxShape.circle,
                ),
              ),
            const Spacer(),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text("Mark as read"),
                  onTap: () {
                    setState(() {
                      notification.isRead = true;
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text("Delete"),
                  onTap: () {
                    setState(() {
                      notifications.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem {
  final int id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String timestamp;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.timestamp,
    required this.isRead,
  });
}
