// lib/views/user_view.dart
import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: SvgPicture.network('https://upload.wikimedia.org/wikipedia/commons/a/a0/MVC-Process.svg'),
            ),
            textBox('Model–view–controller (MVC) is a software design pattern commonly used for developing user interfaces that divides the related program logic into three interconnected elements. These elements are:'),
            textBox('Model: Represents the data and business logic'),
            textBox('View: Represents the UI components'),
            textBox('Controller: Acts as an intermediary between the Model and the View, handling user input and updating the Model and View accordingly'),
            Divider(),
            Text('User Name: ${_userController.user.name}', style: TextStyle(fontSize: 24)),
            Text('User Age: ${_userController.user.age}', style: TextStyle(fontSize: 24)),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Padding (
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
              child: Text('Example: Enter user inputs to update'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
