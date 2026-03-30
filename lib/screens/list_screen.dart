import 'package:flutter/material.dart';
import 'package:mylearningapp/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'form_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

Future<void> _showConfirmationDialog(
  BuildContext context,
  String? userId,
) async {
  return showDialog<void>(
    context: context,
    // Prevents the dialog from being dismissed by tapping outside it
    barrierDismissible: false,
    builder: (BuildContext context) {
      final provider = Provider.of<UserProvider>(context);
      return AlertDialog(
        title: const Text('Confirm Action'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to proceed with this action?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            // Action for 'Cancel'
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismisses the dialog
            },
          ),
          TextButton(
            // Action for 'Confirm'
            child: const Text('Confirm'),
            onPressed: () {
              provider.deleteUser(userId!);
              // Perform the action here, e.g., delete item, save data
              Navigator.of(context).pop(); // Dismisses the dialog
              // Add further logic after confirmation
            },
          ),
        ],
      );
    },
  );
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: provider.users.isEmpty
          ? Center(child: Text("No Records Found"))
          : ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                final user = provider.users[index];

                return Card(
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.green),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FormScreen(user: user),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // provider.deleteUser(user.id);
                            _showConfirmationDialog(context, user.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FormScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
