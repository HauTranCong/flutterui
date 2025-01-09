import 'package:flutter/material.dart';
import 'src/screens/widgetcatalog/actions_page.dart';
import 'src/screens/widgetcatalog/communication_page.dart';
import 'src/screens/widgetcatalog/containment_page.dart';
import 'src/screens/widgetcatalog/navigation_page.dart';
import 'src/screens/widgetcatalog/selection_page.dart';
import 'src/screens/widgetcatalog/text_inputs_page.dart';
import 'src/screens/layout/introduction_page.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    ActionsPage(),
    CommunicationPage(),
    ContainmentPage(),
    NavigationPage(),
    SelectionPage(),
    TextInputsPage(),
    IntroductionPage(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text('Flutter'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: widgetCatalog.map((category) {
            return ExpansionTile(
              title: Text(category['title']),
              initiallyExpanded: category['children'].any((subcategory) => subcategory['index'] == _selectedPageIndex),
              children: category['children'].map<Widget>((subcategory) {
                return ListTile(
                  title: Text(subcategory['title']),
                  selected: _selectedPageIndex == subcategory['index'],
                  onTap: () {
                    _selectPage(subcategory['index']);
                    Navigator.pop(context); // Close the drawer
                  },
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
      body: IndexedStack(
        index: _selectedPageIndex,
        children: _pages,
      ),
    );
  }

  final List<Map<String, dynamic>> widgetCatalog = [
    {
      'title': 'Widgets',
      'children': [
        {'title': 'Actions', 'index': 0},
        {'title': 'Communication', 'index': 1},
        {'title': 'Containment', 'index': 2},
        {'title': 'Navigation', 'index': 3},
        {'title': 'Selection', 'index': 4},
        {'title': 'Text Inputs', 'index': 5},
      ],
    },
    {
      'title': 'Layout',
      'children': [
        {'title': 'Introduction', 'index': 6},
      ],
    },
  ];
}