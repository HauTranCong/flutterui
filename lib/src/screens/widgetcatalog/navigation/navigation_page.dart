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

  final List<String> subtitles = [
    'Top app bars display navigation, actions, and text at the top of a screen',
    'This is the Bottom App Bar page',
    'This is the Navigation Bar page',
    'This is the Navigation Drawer page',
    'This is the Navigation Rail page',
    'This is the Tab Bar page',
  ];

  final List<Widget> pageWidgets = [
    AppBarScreen(),
    BottomAppBarScreen(),
    NavigationBarScreen(),
    NavigationDrawerScreen(),
    NavigationRailScreen(),
    TabBarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = viewWidth > 1200 ? 4 : viewWidth > 800 ? 4 : 2;
    double childAspectRatio = viewWidth > 1200 ? 2 : viewWidth > 800 ? 1.5 : 1;

    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return HoverCard(
            title: pages[index],
            subtitle: subtitles[index],
            page: pageWidgets[index],
          );
        },
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget page;

  HoverCard({required this.title, required this.subtitle, required this.page});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.subtitle, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}