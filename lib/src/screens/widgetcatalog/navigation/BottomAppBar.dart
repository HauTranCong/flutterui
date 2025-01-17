import 'package:flutter/material.dart';

class BottomAppBarScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('BottomAppBar Example'),
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        // Add your widgets here
                    ],
                ),
            ),
            bottomNavigationBar: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 6.0,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {},
                        ),
                        IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                        ),
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Increment',
                child: Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
    }
}