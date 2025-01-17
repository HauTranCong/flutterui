import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Navigation Drawer'),
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