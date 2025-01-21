import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class NavigationDrawerModal extends StatefulWidget {
  @override
  _NavigationDrawerModalState createState() => _NavigationDrawerModalState();
}

class _NavigationDrawerModalState extends State<NavigationDrawerModal> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer Modal Example'),
      ),
      drawer: DecoratedDrawers(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Navigation Drawer Modal - Page Index = $_selectedIndex'),
            textBox('#', inputFontSize: 18, url: 'https://m3.material.io/components/navigation-drawer/overview', alignment: Alignment.center),
          ],
        ),
      ),
    );
  }
}

class DecoratedDrawers extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const DecoratedDrawers({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double listTileBorderRadius = 24.0;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 16, 10),
            child: Text(
              'ListTile items',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            selected: selectedIndex == 0,
            selectedTileColor: Colors.grey.withOpacity(0.1),
            onTap: () => onItemTapped(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(listTileBorderRadius),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            selected: selectedIndex == 1,
            selectedTileColor: Colors.grey.withOpacity(0.1),
            onTap: () => onItemTapped(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(listTileBorderRadius),
            ),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contacts'),
            selected: selectedIndex == 2,
            selectedTileColor: Colors.grey.withOpacity(0.1),
            onTap: () => onItemTapped(2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(listTileBorderRadius),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            selected: selectedIndex == 3,
            selectedTileColor: Colors.grey.withOpacity(0.1),
            onTap: () => onItemTapped(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(listTileBorderRadius),
            ),
          ),
        ],
      ),
    );
  }
}