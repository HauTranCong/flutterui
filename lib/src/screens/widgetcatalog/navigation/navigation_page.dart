import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'BottomAppBar.dart';
import 'NavigationBar.dart';
import 'NavigationDrawer.dart';
import 'NavigationRail.dart';
import 'TabBar.dart';


class NavigationPage extends StatelessWidget {
  final List<String> pages = [
    'App Bar',
    'Bottom App Bar',
    'Navigation Bar',
    'Navigation Drawer',
    'Navigation Rail',
    'Tab Bar',
  ];

  final List<Widget> pageWidgets = [
    AppBarScreen(),
    BottomAppBarScreen(),
    NavigationBarScreen(),
    NavigationDrawerScreen(),
    NavigationRailScreen(),
    TabBarScreen(),
  ];

  final List<String> imagePages = [
    'https://images.unsplash.com/photo-1560986752-2e31d9507413?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1439556838232-994e4c0d3b7c?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1535087419977-e933e68008ba?q=80&w=2478&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1582073298684-895d527ba68d?q=80&w=2535&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1567095146381-6f42e5f224ed?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1569768659481-c6a5dbde2a1d?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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