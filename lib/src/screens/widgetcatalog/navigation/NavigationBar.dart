import 'package:flutter/material.dart';

class NavigationBarScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Navigation Bar Screen'),
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        // Add your widgets here
                    ],
                ),
            ),
        );
    }
}