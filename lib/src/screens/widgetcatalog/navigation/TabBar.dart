import 'package:flutter/material.dart';

class TabBarScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Tab Bar Screen'),
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