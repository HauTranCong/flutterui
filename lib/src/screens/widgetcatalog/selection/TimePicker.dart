import 'package:flutter/material.dart';

class TimePickerScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Time Picker Screen'),
            ),
            body: Center(
                child: Text('This is the Time Picker Screen'),
            ),
        );
    }
}