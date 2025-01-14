import 'package:flutter/material.dart';
import 'alertdialog.dart';
import 'bottomsheet.dart';
import 'card.dart';
import 'divider.dart';
import 'listtile.dart';

class ContainmentPage extends StatelessWidget {
  final List<String> pages = [
    'Alert Dialog',
    'Bottom Sheet',
    'Card',
    'Divider',
    'List Tile',
  ];

  final List<Widget> pageWidgets = [
    AlertDialogScreen(),
    BottomSheetScreen(),
    CardScreen(),
    DividerScreen(),
    ListTileScreen(),
  ];

  final List<String> imagePages = [
    'https://images.unsplash.com/photo-1728741517341-914700d8c6cb?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1732008278594-3f3272927445?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1730472528771-e19d425bc597?q=80&w=2532&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1624106784587-facb5dcfef45?q=80&w=2532&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1732571751679-180d7987a81f?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Actions')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Increase the number of columns to decrease item size
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