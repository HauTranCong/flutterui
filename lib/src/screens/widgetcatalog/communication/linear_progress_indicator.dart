import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class LinearProgressIndicatorPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Linear Progress Indicator'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        LinearProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading...'),
                    ],
                ),
            ),
        );
    }
}