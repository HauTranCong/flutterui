import 'package:flutter/material.dart';

class BottomSheetScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Bottom Sheet'),
            ),
            body: ListView(
                children: [
                    Column(
                        children: [
                            TextField(
                                decoration: InputDecoration(
                                    labelText: 'Enter text',
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}