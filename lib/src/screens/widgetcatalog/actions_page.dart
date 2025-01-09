import 'package:flutter/material.dart';
import 'actions/common_buttons.dart';
import 'actions/floating_action_button.dart';
import 'actions/extended_floating_action_button.dart';
import 'actions/icon_button.dart';
import 'actions/segment_button.dart';

class ActionsPage extends StatelessWidget {
  final List<String> pages = [
    'Common Buttons',
    'FloatingActionButton',
    'Extended FloatingActionButton',
    'IconButton',
    'SegmentButton',
  ];

  final List<Widget> pageWidgets = [
    CommonButtons(),
    FloatingActionButtonPage(),
    ExtendedFloatingActionButtonPage(),
    IconButtonPage(),
    SegmentButtonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Actions')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Increase the number of columns to decrease item size
        ),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the respective page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pageWidgets[index],
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8.0), // Add margin to decrease the size further
              child: Center(
                child: Text(pages[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}