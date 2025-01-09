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
          return HoverCard(
            title: pages[index],
            page: pageWidgets[index],
          );
        },
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String title;
  final Widget page;

  HoverCard({required this.title, required this.page});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.page,
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Card(
          color: _isHovered ? Colors.white : Colors.blue[10],
          margin: EdgeInsets.all(8.0), // Add margin to decrease the size further
          child: Center(
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}