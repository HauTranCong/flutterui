import 'package:flutter/material.dart';
import 'Checkbox.dart';
import 'Chip.dart';
import 'DatePicker.dart';
import 'Menu.dart';
import 'Radio.dart';
import 'Slider.dart';
import 'Switch.dart';
import 'TimePicker.dart';

class SelectionPage extends StatelessWidget {
  final List<String> pages = const [
    'Checkbox',
    'Chip',
    'DatePicker',
    'Menu',
    'Radio',
    'Slider',
    'Switch',
    'TimePicker',
  ];

  final List<String> subtitles = const [
    'Checkboxes let users select one or more items from a list, or turn an item on or off',
    'Chips help people enter information, make selections, filter content, or trigger actions',
    'Date pickers let people select a date, or a range of dates',
    'Menus display a list of choices on a temporary surface',
    'Radio buttons let people select one option from a set of options',
    'Sliders let users make selections from a range of values',
    'Switches toggle the selection of an item on or off',
    'Time pickers help users select and set a specific time',
  ];

  final List<Widget> pageWidgets = [
    CheckboxScreen(),
    ChipScreen(),
    DatePickerScreen(),
    MenuScreen(),
    RadioScreen(),
    SliderScreen(),
    SwitchScreen(),
    TimePickerScreen(),
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

  const HoverCard({
    required this.title,
    required this.subtitle,
    required this.page,
    super.key,
  });

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