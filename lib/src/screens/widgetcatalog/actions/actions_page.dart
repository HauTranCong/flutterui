import 'package:flutter/material.dart';
import 'common_buttons.dart';
import 'floating_action_button.dart';
import 'extended_floating_action_button.dart';
import 'icon_button.dart';
import 'segment_button.dart';

class ActionsPage extends StatelessWidget {
  final List<String> pages = const [
    'Common Buttons',
    'FloatingActionButton',
    'Extended FloatingActionButton',
    'IconButton',
    'SegmentButton',
  ];

  final List<String> subtitles = const [
    'Buttons let people take action and make choices with one tap',
    'Floating action buttons (FABs) help people take primary actions',
    'Extended floating action buttons (extended FABs) help people take primary actions',
    'Icon buttons help people take minor actions with one tap',
    'Segmented buttons help people select options, switch views, or sort elements',
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
    double viewWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = viewWidth > 1200 ? 4 : viewWidth > 800 ? 4 : 2;
    double childAspectRatio = viewWidth > 1200 ? 2 : viewWidth > 800 ? 1.5 : 1;

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

  const HoverCard({required this.title, required this.subtitle, required this.page});

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