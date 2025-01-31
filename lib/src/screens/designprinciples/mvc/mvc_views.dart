// lib/views/user_view.dart
import 'package:flutter/material.dart';
import 'mvc_controller.dart';

class MVC extends StatefulWidget {
  @override
  _MVCState createState() => _MVCState();
}

class _MVCState extends State<MVC> {
  final UserController _userController = UserController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _updateUser() {
    setState(() {
      String name = _nameController.text;
      String ageText = _ageController.text;
      int? age = int.tryParse(ageText);

      if (name.isEmpty) {
        // Handle invalid name input
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Name cannot be empty')),
        );
        return;
      }

      if (age == null) {
        // Handle invalid age input
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Age must be a valid number')),
        );
        return;
      }

      _userController.updateUserName(name);
      _userController.updateUserAge(age);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC in Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Name: ${_userController.user.name}', style: TextStyle(fontSize: 24),),
            Text('Age: ${_userController.user.age}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Padding (
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _updateUser();
                }, 
              child: Text('User input'),)
          ],
        ),
      ),
    );
  }
}
