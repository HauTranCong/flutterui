import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  final String title;

  // Constructor for initializing immutable properties
  MyStatelessWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Hello, $title!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyStatelessWidget(title: 'Stateless Example'),
  ));
}
