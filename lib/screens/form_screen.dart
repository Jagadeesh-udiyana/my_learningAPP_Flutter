import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';

class FormScreen extends StatefulWidget {
  final UserModel? user;

  const FormScreen({super.key, this.user});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String? gender;

  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      name = widget.user!.name;
      email = widget.user!.email;
      gender = widget.user?.gender ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? "Add User" : "Edit User"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 🔹 NAME FIELD
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  if (value.length < 3) {
                    return "Minimum 3 characters required";
                  }
                  if (value.length > 20) {
                    return "Maximum 20 characters allowed";
                  }
                  return null;
                },
                onSaved: (val) => name = val!,
              ),

              // 🔹 EMAIL FIELD
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }

                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if (!emailRegex.hasMatch(value)) {
                    return "Enter valid email";
                  }
                  return null;
                },
                onSaved: (val) => email = val!,
              ),

              // 🔹 GENDER DROPDOWN
              DropdownButtonFormField<String>(
                initialValue: genders.contains(gender) ? gender : null,
                decoration: InputDecoration(labelText: "Gender"),
                items: genders.map((g) {
                  return DropdownMenuItem(value: g, child: Text(g));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    gender = val;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select gender";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // 🔹 SAVE BUTTON
              ElevatedButton(
                child: Text("Save"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (widget.user == null) {
                      // CREATE
                      final newUser = UserModel(
                        id: Uuid().v4(),
                        name: name,
                        email: email,
                        gender: gender!,
                      );
                      // provider.addUser(newUser);
                      context.read<UserProvider>().addUser(newUser);
                    } else {
                      // UPDATE
                      final updatedUser = UserModel(
                        id: widget.user!.id,
                        name: name,
                        email: email,
                        gender: gender!,
                      );
                      provider.updateUser(updatedUser);
                    }

                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
