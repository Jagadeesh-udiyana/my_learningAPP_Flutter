import 'package:flutter/material.dart';
import 'package:mylearningapp/screens/home_screen.dart';
import '../services/profile_service.dart';
import '../models/employee_model.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  final ProfileService _service = ProfileService();
  Employee? employee;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final data = await _service.getProfile();
      setState(() {
        employee = data;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : employee == null
          ? Center(child: Text("No Data"))
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),

                  // 🔥 PROFILE HEADER
                  CircleAvatar(
                    radius: 50,
                    child: Text(
                      employee!.name.isNotEmpty ? employee!.name[0] : "U",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),

                  SizedBox(height: 10),
                  Text(
                    employee!.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(employee!.designation),

                  SizedBox(height: 20),

                  // 🔥 DETAILS CARD
                  Card(
                    margin: EdgeInsets.all(16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        buildTile(Icons.email, "Email", employee!.email),
                        buildTile(Icons.phone, "Mobile", employee!.mobile),
                        buildTile(Icons.location_city, "City", employee!.city),
                        buildTile(Icons.business, "Branch", employee!.branch),
                        buildTile(
                          Icons.person,
                          "Gender",
                          employee!.gender ?? "N/A",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
