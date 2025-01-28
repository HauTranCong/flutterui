import 'package:flutter/material.dart';
import 'navigation_bar_with_destination_pages.dart';

class NavigationBarScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Navigation Bar Examples'),
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: [
                        Card(
                            margin: EdgeInsets.all(16.0),
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.5, // Adjust height dynamically
                                    child: NavigationExample(),
                                ),
                            ),
                            color: Colors.grey[200],
                        ),
                        Card(
                            margin: EdgeInsets.all(16.0),
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.5, // Adjust height dynamically
                                    child: NavigationBarWithDestinationPages(),
                                ),
                            ),
                            color: Colors.grey[200],
                        ),
                    ],
                ),
            ),
        );
    }
}

class NavigationExample extends StatefulWidget {
    const NavigationExample({super.key});

    @override
    State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
    int currentPageIndex = 0;
    NavigationDestinationLabelBehavior labelBehavior =
        NavigationDestinationLabelBehavior.alwaysShow;

    @override
    Widget build(BuildContext context) {
        final ThemeData theme = Theme.of(context);
        return Scaffold(
            appBar: AppBar(
                title: const Text('Navigation Bar Within Scaffold'),
                automaticallyImplyLeading: false,
            ),
            bottomNavigationBar: NavigationBar(
                labelBehavior: labelBehavior,
                onDestinationSelected: (int index) {
                    setState(() {
                        currentPageIndex = index;
                    });
                },
                indicatorColor: Colors.amber,
                selectedIndex: currentPageIndex,
                destinations: const <Widget>[
                    NavigationDestination(
                        selectedIcon: Icon(Icons.home),
                        icon: Icon(Icons.home_outlined),
                        label: 'Home',
                    ),
                    NavigationDestination(
                        icon: Badge(
                            label: Text('2'),
                            child: Icon(Icons.notifications_sharp)
                            ),
                        label: 'Notifications',
                    ),
                    NavigationDestination(
                        icon: Badge(
                            label: Text('2'),
                            child: Icon(Icons.messenger_sharp),
                        ),
                        label: 'Messages',
                    ),
                ],
            ),
            body: <Widget>[
                /// Home page
                Card(
                    shadowColor: Colors.transparent,
                    margin: const EdgeInsets.all(8.0),
                    child: SizedBox.expand(
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    Text('Label behavior: ${labelBehavior.name}'),
                                    const SizedBox(height: 10),
                                    OverflowBar(
                                        spacing: 10.0,
                                        children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        labelBehavior =
                                                            NavigationDestinationLabelBehavior.alwaysShow;
                                                    });
                                                },
                                                child: const Text('alwaysShow'),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        labelBehavior =
                                                            NavigationDestinationLabelBehavior.onlyShowSelected;
                                                    });
                                                },
                                                child: const Text('onlyShowSelected'),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                    setState(() {
                                                        labelBehavior =
                                                            NavigationDestinationLabelBehavior.alwaysHide;
                                                    });
                                                },
                                                child: const Text('alwaysHide'),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ),
                    ),
                ),

                /// Notifications page
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                        children: <Widget>[
                            Card(
                                child: ListTile(
                                    leading: Icon(Icons.notifications_sharp),
                                    title: Text('Notification 1'),
                                    subtitle: Text('This is a notification'),
                                ),
                            ),
                            Card(
                                child: ListTile(
                                    leading: Icon(Icons.notifications_sharp),
                                    title: Text('Notification 2'),
                                    subtitle: Text('This is a notification'),
                                ),
                            ),
                        ],
                    ),
                ),

                /// Messages page
                ListView.builder(
                    reverse: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                            return Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    margin: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        color: theme.colorScheme.primary,
                                        borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Text(
                                        'Hello',
                                        style: theme.textTheme.bodyLarge!
                                                .copyWith(color: theme.colorScheme.onPrimary),
                                    ),
                                ),
                            );
                        }
                        return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                    'Hi!',
                                    style: theme.textTheme.bodyLarge!
                                            .copyWith(color: theme.colorScheme.onPrimary),
                                ),
                            ),
                        );
                    },
                ),
            ][currentPageIndex],
        );
    }
}
