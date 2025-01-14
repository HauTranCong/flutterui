import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Card'),
            ),
            body: ListView(
                children: [
                    Column(
                        children: [
                            TextField(
                                decoration: InputDecoration(
                                    labelText: 'Enter text',
                                    border: OutlineInputBorder(),
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}