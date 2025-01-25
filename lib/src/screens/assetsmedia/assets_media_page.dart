import 'package:flutter/material.dart';
import 'Images.dart';
import 'Fonts.dart';

class AssetsMediaPage extends StatelessWidget {
  final List<String> pages = const [
    'Images',
    'Fronts',
  ];

  final List<String> subtitles = const [
    'Badges show notifications, counts, or status information on navigation items and icons',
    'Text fonts',
  ];

  final List<Widget> pageWidgets = [
    ImagesPage(),
    FontsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = viewWidth > 1200
        ? 4
        : viewWidth > 800
            ? 4
            : 2;
    double childAspectRatio = viewWidth > 1200
        ? 2
        : viewWidth > 800
            ? 1.5
            : 1;

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
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

  const HoverCard(
      {required this.title, required this.subtitle, required this.page});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget.page,
                ),
              );
            },
            // splashColor: Colors.blue.withAlpha(30),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxWidth * 0.075,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      // color: Colors.grey,
                      fontSize: constraints.maxWidth * 0.0325,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
