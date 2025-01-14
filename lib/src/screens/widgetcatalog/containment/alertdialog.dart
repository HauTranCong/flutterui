import 'package:flutter/material.dart';

class AlertDialogScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Alert Dialog'),
            ),
            body: ListView(
                children: <Widget>[
                    Column(
                        children: <Widget>[
                            ListTile(
                                title: Text('Item 1'),
                            ),
                            ListTile(
                                title: Text('Item 2'),
                            ),
                            ListTile(
                                title: Text('Item 3'),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}