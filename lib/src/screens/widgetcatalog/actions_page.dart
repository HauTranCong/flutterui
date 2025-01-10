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

  final List<String> imagePages = [
    'https://images.unsplash.com/photo-1699286756200-d2dde241262c?q=80&w=2532&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1733068698906-be2baae07782?q=80&w=2532&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1733056883310-0e1658d09c36?q=80&w=2380&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1719014322787-f0b1e16d2712?q=80&w=2456&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1657497850541-b0199c958846?q=80&w=2500&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
            imageUrl: imagePages[index], // Add imageUrl
            page: pageWidgets[index],
          );
        },
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String title;
  final String imageUrl; // Add imageUrl property
  final Widget page;

  HoverCard({required this.title, required this.imageUrl, required this.page});

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Card(
              color: _isHovered ? Colors.blue[70] : Colors.white,
              margin: EdgeInsets.all(8.0), // Add margin to decrease the size further
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: constraints.maxHeight * 0.7, // 70% of the parent's height
                    margin: EdgeInsets.all(8.0), // Same margin as the parent
                    color: Colors.green.withOpacity(0.5), // Green background with 50% opacity
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(height: 8.0), // Add some space between container and text
                  Text(widget.title),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}