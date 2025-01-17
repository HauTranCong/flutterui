import 'package:flutter/material.dart';

final List<int> _items = List<int>.generate(51, (int index) => index);

class AppBarScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final ButtonStyle style = TextButton.styleFrom(
            foregroundColor: Colors.blue,
        );

        return const AppBarExample();
    }
}

class AppBarExample extends StatefulWidget {
    const AppBarExample({super.key});

    @override
    State<AppBarExample> createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {
    bool shadowColor = false;
    double? scrolledUnderElevation;
    final List<String> titles = <String>[
        'Cloud',
        'Beach',
        'Sunny',
    ];

    @override
    Widget build(BuildContext context) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
        final Color oddItemColor = colorScheme.primary;
        final Color evenItemColor = colorScheme.primary;
        const int tabsCount = 3;

        return DefaultTabController(
            initialIndex: 1,
            length: tabsCount,
            child: Scaffold(
                appBar: AppBar(
                    title: const Text('Top app bars display navigation, actions, and text at the top of a screen'),
                    scrolledUnderElevation: scrolledUnderElevation,
                    shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
                    notificationPredicate: (ScrollNotification notification) {
                        return notification.depth == 1;
                    },
                    bottom: TabBar(
                        tabs: <Widget>[
                            Tab(
                                icon: const Icon(Icons.cloud_outlined),
                                text: titles[0],
                            ),
                            Tab(
                                icon: const Icon(Icons.beach_access_sharp),
                                text: titles[1],
                            ),
                            Tab(
                                icon: const Icon(Icons.brightness_5_sharp),
                                text: titles[2],
                            ),
                        ],
                    ),
                ),
                // body: GridView.builder(
                //     itemCount: _items.length,
                //     padding: const EdgeInsets.all(8.0),
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 3,
                //         childAspectRatio: 2.0,
                //         mainAxisSpacing: 10.0,
                //         crossAxisSpacing: 10.0,
                //     ),
                //     itemBuilder: (BuildContext context, int index) {
                //         if (index == 0) {
                //             return Center(
                //                 child: Text(
                //                     'Scroll to see the Appbar in effect.',
                //                     style: Theme.of(context).textTheme.labelLarge,
                //                     textAlign: TextAlign.center,
                //                 ),
                //             );
                //         }
                //         return Container(
                //             alignment: Alignment.center,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20.0),
                //                 color: _items[index].isOdd ? oddItemColor : evenItemColor,
                //             ),
                //             child: Text('Item $index'),
                //         );
                //     },
                // ),
                body: TabBarView(
                    children: <Widget>[
                        ListView.builder(
                            itemCount: 25,
                            itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                tileColor: index.isOdd ? oddItemColor : evenItemColor,
                                title: Text('${titles[0]} $index'),
                                );
                            },
                        ),
                        ListView.builder(
                            itemCount: 25,
                            itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                tileColor: index.isOdd ? oddItemColor : evenItemColor,
                                title: Text('${titles[1]} $index'),
                                );
                            },
                        ),
                        ListView.builder(
                            itemCount: 25,
                            itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                tileColor: index.isOdd ? oddItemColor : evenItemColor,
                                title: Text('${titles[2]} $index'),
                                );
                            },
                        ),
                    ],
                ),
                bottomNavigationBar: BottomAppBar(
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: OverflowBar(
                            overflowAlignment: OverflowBarAlignment.center,
                            alignment: MainAxisAlignment.center,
                            overflowSpacing: 5.0,
                            children: <Widget>[
                                ElevatedButton.icon(
                                    onPressed: () {
                                        setState(() {
                                            shadowColor = !shadowColor;
                                        });
                                    },
                                    icon: Icon(
                                        shadowColor ? Icons.visibility_off : Icons.visibility,
                                    ),
                                    label: const Text('shadow color'),
                                ),
                                const SizedBox(width: 5),
                                ElevatedButton(
                                    onPressed: () {
                                        if (scrolledUnderElevation == null) {
                                            setState(() {
                                                scrolledUnderElevation = 4.0;
                                            });
                                        } else {
                                            setState(() {
                                                scrolledUnderElevation = scrolledUnderElevation! + 1.0;
                                            });
                                        }
                                    },
                                    child: Text(
                                        'scrolledUnderElevation: ${scrolledUnderElevation ?? 'default'}',
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
