import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('ListTile'),
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