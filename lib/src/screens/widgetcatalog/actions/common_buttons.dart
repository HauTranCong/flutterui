import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Common Buttons')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Common Buttons Content',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.network('https://images.unsplash.com/photo-1735924196975-b3c7464167eb?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            SizedBox(height: 20),
            Text(
              'More content here...',
              style: TextStyle(fontSize: 18),
            ),
            // Add more widgets as needed
          ],
        ),
      ),
    );
  }
}