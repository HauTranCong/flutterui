import 'package:flutter/material.dart';
import 'src/screens/widgetcatalog/actions/actions_page.dart';
import 'src/screens/widgetcatalog/communication/communication_page.dart';
import 'src/screens/widgetcatalog/containment/containment_page.dart';
import 'src/screens/widgetcatalog/navigation/navigation_page.dart';
import 'src/screens/widgetcatalog/selection/selection_page.dart';
import 'src/screens/widgetcatalog/text_inputs/text_inputs_page.dart';
import 'src/screens/introduction/introduction_page.dart';
import 'src/screens/assetsmedia/assets_media_page.dart';
import 'src/screens/designprinciples/designprinciples_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Journey',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(
        isDarkTheme: _isDarkTheme,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool isDarkTheme;
  final Function toggleTheme;

  const MyHomePage(
      {required this.isDarkTheme, required this.toggleTheme, Key? key})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPageIndex = 8;
  final double listTileBorderRadius = 24.0;

  final List<Widget> _pages = [
    IntroductionPage(),
    ActionsPage(),
    CommunicationPage(),
    ContainmentPage(),
    NavigationPage(),
    SelectionPage(),
    TextInputsPage(),
    AssetsMediaPage(),
    DesignPrinciplesPage(),
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
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Flutter Docs'),
        ),
      ),
      drawer: Drawer(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: widgetCatalog.length,
          itemBuilder: (context, index) {
            final category = widgetCatalog[index];
            return ExpansionTile(
              title: Text(category['title']),
              initiallyExpanded: category['children'].any(
                  (subcategory) => subcategory['index'] == _selectedPageIndex),
              children: category['children'].map<Widget>((subcategory) {
                return ListTile(
                  title: Text(subcategory['title']),
                  selected: _selectedPageIndex == subcategory['index'],
                  selectedTileColor: Colors.purple.withOpacity(0.1),
                  onTap: () {
                    _selectPage(subcategory['index']);
                    Navigator.pop(context); // Close the drawer
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(listTileBorderRadius),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      body: IndexedStack(
        index: _selectedPageIndex,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.toggleTheme(),
        child: const Icon(Icons.brightness_6),
      ),
    );
  }

  final List<Map<String, dynamic>> widgetCatalog = const [
    {
      'title': 'Flutter Journey',
      'children': [
        {'title': 'Introduction', 'index': 0},
      ],
    },
    {
      'title': 'Widgets',
      'children': [
        {'title': 'Actions', 'index': 1},
        {'title': 'Communication', 'index': 2},
        {'title': 'Containment', 'index': 3},
        {'title': 'Navigation', 'index': 4},
        {'title': 'Selection', 'index': 5},
        {'title': 'Text Inputs', 'index': 6},
      ],
    },
    {
      'title': 'Assets & Media',
      'children': [
        {'title': 'Images', 'index': 7},
        // {'title': 'Videos', 'index': 8},
      ],
    },
    {
      'title': 'Design Principles',
      'children': [
        {'title': 'Dependency Injection', 'index': 8},
      ],
    },
  ];
}
