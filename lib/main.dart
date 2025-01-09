import 'package:flutter/material.dart';
import 'src/screens/widgetcatalog/actions_page.dart';
import 'src/screens/widgetcatalog/communication_page.dart';
import 'src/screens/widgetcatalog/containment_page.dart';
import 'src/screens/widgetcatalog/navigation_page.dart';
import 'src/screens/widgetcatalog/selection_page.dart';
import 'src/screens/widgetcatalog/text_inputs_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Journey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> widgetCatalog = [
    {
      'title': 'Widgets',
      'children': [
        {
          'title': 'Actions',
          'page': ActionsPage(),
        },
        {
          'title': 'Communication',
          'page': CommunicationPage(),
        },
        {
          'title': 'Containment',
          'page': ContainmentPage(),
        },
        {
          'title': 'Navigation',
          'page': NavigationPage(),
        },
        {
          'title': 'Selection',
          'page': SelectionPage(),
        },
        {
          'title': 'Text Inputs',
          'page': TextInputsPage(),
        },
      ],
    },
    // {
    //   'title': 'Layout',
    //   'children': [
    //     {
    //       'title': 'Introduction',
    //       'page': IntroductionPage(),
    //     },
    //   ],
    // },
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
                        builder: (context) => subcategory['page'],
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
      body: Center(child: Text('Select a category from the drawer')),
    );
  }
}