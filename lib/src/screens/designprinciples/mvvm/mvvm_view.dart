import 'package:flutter/material.dart';
import 'mvvm_model.dart'; // Import the model

class UserViewModel extends ChangeNotifier {
  User _user = User(name: "John Doe", age: 25);

  User get user => _user;

  void updateUser(String name, int age) {
    _user = User(name: name, age: age);
    notifyListeners(); // Notify UI to update
  }
}
