import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class ImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images Example'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            textBox('Image from Network', alignment: Alignment.center),
            Image.network(
              'https://images.unsplash.com/photo-1729595404256-dcc92f77c54a?q=80&w=1941&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(height: 20),
            textBox('Image from Local Assets', alignment: Alignment.center),
            Image.asset(
              'assets/images/lukas-hadrich-wCLCK9LDDjI-unsplash.jpg',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
