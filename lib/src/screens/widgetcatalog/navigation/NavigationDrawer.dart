import 'package:flutter/material.dart';
import 'NavigationDrawerStandard.dart';
import 'NavigationDrawerModal.dart';

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
                        Card(
                            margin: EdgeInsets.all(16.0),
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.75, // Adjust height dynamically
                                    child: NavigationDrawerStandard(),
                                ),
                            ),
                            color: Colors.grey[200],
                        ),
                        Card(
                            margin: EdgeInsets.all(16.0),
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.75, // Adjust height dynamically
                                    child: NavigationDrawerModal(),
                                ),
                            ),
                            color: Colors.grey[200],
                        ),
                    ],
                ),
            ),
        );
    }
}
