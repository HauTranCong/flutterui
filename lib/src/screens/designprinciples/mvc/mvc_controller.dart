// lib/controllers/user_controller.dart
import 'mvc_models.dart';

class UserController {
  User _user = User(name: 'John Doe', age: 25);

  // Getter for the user
  User get user => _user;

  // Method to update the user's name
  void updateUserName(String newName) {
    _user.name = newName;
  }

  // Method to update the user's age
  void updateUserAge(int newAge) {
    _user.age = newAge;
  }
}