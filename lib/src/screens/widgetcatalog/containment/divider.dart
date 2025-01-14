import 'package:flutter/material.dart';

class DividerScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Divider'),
            ),
            body: ListView(
                children: [
                    Column(
                        children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter text',
                                    ),
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}