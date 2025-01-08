import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Journey',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> widgetCatalog = [
    {
      'title': 'Widget Catalog',
      'children': [
        {
          'title': 'Actions',
        },
        {
          'title': 'Communication',
        },
        {
          'title': 'Containment',
        },
        {
          'title': 'Navigation',
        },
        {
          'title': 'Selection',
        },
        {
          'title': 'Text Inputs',
        },
      ],
    },
    {
      'title': 'Layout',
      'children': [
        {
          'title': 'Introduction',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: widgetCatalog.map((category) {
            return ExpansionTile(
              title: Text(category['title']),
              children: category['children'].map<Widget>((subcategory) {
                return ListTile(
                  title: Text(subcategory['title']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WidgetDetailPage(
                          widgetName: subcategory['title'],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
      body: Center(
        child: Text(
          'Explore the Flutter Widget Catalog using the navigation drawer.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class WidgetDetailPage extends StatelessWidget {
  final String widgetName;

  WidgetDetailPage({required this.widgetName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widgetName)),
      body: Center(
        child: Text(
          'Details and examples for $widgetName.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
