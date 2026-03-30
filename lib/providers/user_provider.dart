import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  void initState() {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
  }

  // Load from local storage
  Future<void> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('users');

    if (data != null) {
      final List decoded = jsonDecode(data);
      _users = decoded.map((e) => UserModel.fromJson(e)).toList();
      notifyListeners();
    }
  }

  // Save to local storage
  Future<void> _saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(_users.map((e) => e.toJson()).toList());
    await prefs.setString('users', data);
  }

  // CREATE
  Future<void> addUser(UserModel user) async {
    _users.add(user);
    await _saveUsers();
    notifyListeners();
  }

  // UPDATE
  Future<void> updateUser(UserModel user) async {
    final index = _users.indexWhere((e) => e.id == user.id);
    if (index != -1) {
      _users[index] = user;
      await _saveUsers();
      notifyListeners();
    }
  }

  // DELETE
  Future<void> deleteUser(String id) async {
    _users.removeWhere((e) => e.id == id);
    await _saveUsers();
    notifyListeners();
  }
}
