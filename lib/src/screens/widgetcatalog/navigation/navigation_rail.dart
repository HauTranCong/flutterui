import 'package:flutter/material.dart';

class NavigationRailScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Navigation Rail'),
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        Card(
                            margin: EdgeInsets.all(16.0),
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.75, // Adjust height dynamically
                                    child: NavRailExample(),
                                ),
                            ),
                            color: Colors.grey[300],
                        ),
                    ],
                ),
            ),
        );
    }
}

class NavRailExample extends StatefulWidget {
    const NavRailExample({super.key});

    @override
    State<NavRailExample> createState() => _NavRailExampleState();
}

class _NavRailExampleState extends State<NavRailExample> {
    int _selectedIndex = 0;
    NavigationRailLabelType labelType = NavigationRailLabelType.all;
    bool showLeading = false;
    bool showTrailing = false;
    double groupAlignment = -1.0;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Row(
                    children: <Widget>[
                        NavigationRail(
                            selectedIndex: _selectedIndex,
                            groupAlignment: groupAlignment,
                            onDestinationSelected: (int index) {
                                setState(() {
                                    _selectedIndex = index;
                                });
                            },
                            labelType: labelType,
                            leading: showLeading
                                    ? FloatingActionButton(
                                            elevation: 0,
                                            onPressed: () {
                                                // Add your onPressed code here!
                                            },
                                            child: const Icon(Icons.add),
                                        )
                                    : const SizedBox(),
                            trailing: showTrailing
                                    ? IconButton(
                                            onPressed: () {
                                                // Add your onPressed code here!
                                            },
                                            icon: const Icon(Icons.more_horiz_rounded),
                                        )
                                    : const SizedBox(),
                            destinations: const <NavigationRailDestination>[
                                NavigationRailDestination(
                                    icon: Icon(Icons.favorite_border),
                                    selectedIcon: Icon(Icons.favorite),
                                    label: Text('First'),
                                ),
                                NavigationRailDestination(
                                    icon: Badge(child: Icon(Icons.bookmark_border)),
                                    selectedIcon: Badge(child: Icon(Icons.book)),
                                    label: Text('Second'),
                                ),
                                NavigationRailDestination(
                                    icon: Badge(
                                        label: Text('4'),
                                        child: Icon(Icons.star_border),
                                    ),
                                    selectedIcon: Badge(
                                        label: Text('4'),
                                        child: Icon(Icons.star),
                                    ),
                                    label: Text('Third'),
                                ),
                            ],
                        ),
                        const VerticalDivider(thickness: 1, width: 1),
                        // This is the main content.
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    Text('selectedIndex: $_selectedIndex'),
                                    const SizedBox(height: 20),
                                    Text('Label type: ${labelType.name}'),
                                    const SizedBox(height: 10),
                                    OverflowBar(
                                        spacing: 10.0,
                                        children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        labelType = NavigationRailLabelType.none;
                                                    });
                                                },
                                                child: const Text('None'),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        labelType = NavigationRailLabelType.selected;
                                                    });
                                                },
                                                child: const Text('Selected'),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        labelType = NavigationRailLabelType.all;
                                                    });
                                                },
                                                child: const Text('All'),
                                            ),
                                        ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text('Group alignment: $groupAlignment'),
                                    const SizedBox(height: 10),
                                    OverflowBar(
                                        spacing: 10.0,
                                        children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        groupAlignment = -1.0;
                                                    });
                                                },
                                                child: const Text('Top'),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        groupAlignment = 0.0;
                                                    });
                                                },
                                                child: const Text('Center'),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        groupAlignment = 1.0;
                                                    });
                                                },
                                                child: const Text('Bottom'),
                                            ),
                                        ],
                                    ),
                                    const SizedBox(height: 20),
                                    OverflowBar(
                                        spacing: 10.0,
                                        children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        showLeading = !showLeading;
                                                    });
                                                },
                                                child: Text(showLeading ? 'Hide Leading' : 'Show Leading'),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        showTrailing = !showTrailing;
                                                    });
                                                },
                                                child: Text(showTrailing ? 'Hide Trailing' : 'Show Trailing'),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
