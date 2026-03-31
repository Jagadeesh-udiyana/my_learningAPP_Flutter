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
  String? _snackMessage;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final result = await _service.getProfile();
      if (!mounted) return;
      setState(() {
        employee = result.employee;
        isLoading = false;
        _snackMessage = result.message;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_snackMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(_snackMessage!)),
          );
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        employee = Employee.fallback();
        isLoading = false;
        _snackMessage = 'Unable to load profile. Showing default profile data.';
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_snackMessage!)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : employee == null
              ? const Center(child: Text("No Data"))
              : ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildHeader(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildSectionTitle('Contact'),
                          buildInfoTile(Icons.email, 'Email', employee!.email),
                          buildInfoTile(Icons.phone, 'Mobile', employee!.mobile),
                          buildInfoTile(Icons.home, 'Alternate Phone', employee!.alternatePhoneNo),
                          buildInfoTile(Icons.location_city, 'Branch', employee!.branchName),
                          const SizedBox(height: 16),
                          _buildSectionTitle('Profile'),
                          buildInfoTile(Icons.badge, 'Employee Code', employee!.employeeCode),
                          buildInfoTile(Icons.person, 'Name', employee!.employeeName),
                          buildInfoTile(Icons.group, 'User Name', employee!.userName),
                          buildInfoTile(Icons.category, 'Category', employee!.category),
                          buildInfoTile(Icons.male, 'Gender', employee!.gender ?? 'N/A'),
                          const SizedBox(height: 16),
                          _buildSectionTitle('Address'),
                          buildInfoTile(Icons.location_on, 'City', employee!.city),
                          buildInfoTile(Icons.location_searching, 'State', employee!.state),
                          buildInfoTile(Icons.flag, 'Country', employee!.country),
                          buildInfoTile(Icons.pin_drop, 'Zip Code', employee!.zipCode),
                          buildInfoTile(Icons.home_outlined, 'Line 1', employee!.address1),
                          buildInfoTile(Icons.add_location_alt, 'Line 2', employee!.address2),
                          if (employee!.address3.isNotEmpty)
                            buildInfoTile(Icons.location_pin, 'Line 3', employee!.address3),
                          const SizedBox(height: 16),
                          _buildSectionTitle('Work & Activity'),
                          buildInfoTile(Icons.work, 'Designation', employee!.designation),
                          buildInfoTile(Icons.calendar_today, 'DOJ', employee!.doj),
                          buildInfoTile(Icons.cake, 'DOB', employee!.dob),
                          buildInfoTile(Icons.timeline, 'YOE', employee!.yoe.toString()),
                          buildInfoTile(Icons.check_circle_outline, 'Status', employee!.status ? 'Active' : 'Inactive'),
                          buildInfoTile(Icons.lock_open, 'Login Allowed', employee!.isLoginAllowed ? 'Yes' : 'No'),
                          const SizedBox(height: 16),
                          _buildSectionTitle('Extras'),
                          buildInfoTile(Icons.emoji_events, 'Achievement', employee!.achievement.isNotEmpty ? employee!.achievement : 'N/A'),
                          buildInfoTile(Icons.person_search, 'Attendance ID', employee!.attendanceID),
                          buildInfoTile(Icons.emergency, 'Emergency Name', employee!.emergencyName),
                          buildInfoTile(Icons.admin_panel_settings, 'Is Admin', employee!.isAdmin ? 'Yes' : 'No'),
                          const SizedBox(height: 16),
                          if (employee!.workAreas.isNotEmpty) _buildChipList('Work areas', employee!.workAreas),
                          if (employee!.specialization.isNotEmpty) _buildChipList('Specialization', employee!.specialization),
                          if (employee!.languagesKnown.isNotEmpty) _buildChipList('Languages known', employee!.languagesKnown),
                        ],
                      ),
                    )
                  ],
                ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final onPrimary = Theme.of(context).colorScheme.onPrimary;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primary.withOpacity(0.75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.only(top: 40, bottom: 24, left: 24, right: 24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.white,
            child: Text(
              employee!.employeeName.isNotEmpty ? employee!.employeeName[0] : 'U',
              style: TextStyle(fontSize: 36, color: primary, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            employee!.employeeName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: onPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            employee!.designation,
            style: TextStyle(color: onPrimary.withOpacity(0.9), fontSize: 16),
          ),
          const SizedBox(height: 14),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildStatusChip(employee!.branchName),
              _buildStatusChip(employee!.category),
              _buildStatusChip(employee!.status ? 'Active' : 'Inactive'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(value.isNotEmpty ? value : 'N/A', style: const TextStyle(color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipList(String title, List<String> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: values
              .map((value) => Chip(
                    label: Text(value),
                    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.14),
                  ))
              .toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildStatusChip(String label) {
    return Chip(
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      backgroundColor: Colors.white.withOpacity(0.18),
      labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }
}
