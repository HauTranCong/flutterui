import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'mvvm_view.dart';


class MVVM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("MVVM (Model-View-ViewModel)"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset('assets/images/mvvm-pattern.png'),
            ),
            textBox('Model–view–controller (MVC) is a software design pattern commonly used for developing user interfaces that divides the related program logic into three interconnected elements. These elements are:'),
            textBox('Model (Data Layer) :Represents data, business logic, and APIs'),
            textBox('View: Displays UI and listens for state changes from the ViewModel'),
            textBox('ViewModel (State Management & Business Logic Layer): Acts as a bridge between Model and View, manages UI state and handles user interactions. Notifies the UI when data changes'),
            Divider(),
            UserScreen(),
          ],
        ),  
      ),
    );
  }
} 

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);

    return Column(
        children: [
          Text("Name: ${userVM.user.name}", style: TextStyle(fontSize: 20)),
          Text("Age: ${userVM.user.age}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              userVM.updateUser("Jane Doe", 30);
            },
            child: Text("Update User"),
          ),
        ],
      );
  }
}
