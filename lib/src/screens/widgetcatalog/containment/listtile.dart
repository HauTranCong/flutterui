import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class ListTileScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Flutter Journey'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: [
                        textBox(
                            'ListTile displays a horizontal row of information, such as an icon, a title, and a subtitle.',
                            inputFontSize: 24,
                        ),
                        textBox(
                            '#',
                            inputFontSize: 24,
                            url: 'https://m3.material.io/components/list-tile/overview',
                        ),
                        Divider(height: 0, color: Colors.black, thickness: 2),
                        textBox(
                            ' ListTile with animation.',
                            inputFontSize: 18,
                        ),
                        ListTileExample(),
                        SizedBox(height: 20),
                        
                        Divider(height: 0, color: Colors.black, thickness: 2),
                        textBox(
                            ' ListTile with cards.',
                            inputFontSize: 18,
                        ),
                        ListTileCards(),
                        SizedBox(height: 20),
                        
                        Divider(height: 0, color: Colors.black, thickness: 2),
                        textBox(
                            ' ListTile with divider.',
                            inputFontSize: 18,
                        ),
                        ListTileWithDivider(),
                        SizedBox(height: 20),
                        
                        Divider(height: 0, color: Colors.black, thickness: 2),
                        textBox(
                            ' ListTile with states.',
                            inputFontSize: 18,
                        ),
                        ListTileCustomization(),
                        SizedBox(height: 20),  

                        Divider(height: 0, color: Colors.black, thickness: 2),
                        textBox(
                            ' ListTile with title alignment.',
                            inputFontSize: 18,
                        ),
                        ListTileAlignment(),
                        SizedBox(height: 20),

                        Divider(height: 0, color: Colors.black, thickness: 2),
                        textBox(
                            ' Custom list item.',
                            inputFontSize: 18,
                        ),
                        const CustomListItemExample(),
                        SizedBox(height: 20),
                    ],
                ),
            ),
        );
    }
}

class ListTileExample extends StatefulWidget {
  const ListTileExample({super.key});

  @override
  State<ListTileExample> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 850),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Hero(
            tag: 'ListTile-Hero',
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the hero transition.
            child: Material(
              child: ListTile(
                title: const Text('ListTile with Hero'),
                subtitle: const Text('Tap here for Hero transition'),
                tileColor: Colors.cyan,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('ListTile Hero')),
                        body: Center(
                          child: Hero(
                            tag: 'ListTile-Hero',
                            child: Material(
                              child: ListTile(
                                title: const Text('ListTile with Hero'),
                                subtitle: const Text('Tap here to go back'),
                                tileColor: Colors.blue[700],
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the fade transition.
            child: const Material(
              child: ListTile(
                title: Text('ListTile with FadeTransition'),
                selectedTileColor: Colors.green,
                selectedColor: Colors.white,
                selected: true,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Center(
              child: SizeTransition(
                sizeFactor: _sizeAnimation,
                axisAlignment: -1.0,
                // Wrap the ListTile in a Material widget so the ListTile has someplace
                // to draw the animated colors during the size transition.
                child: const Material(
                  child: ListTile(
                    title: Text('ListTile with SizeTransition'),
                    tileColor: Colors.red,
                    minVerticalPadding: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
    );
  }
}

class ListTileCards extends StatelessWidget {
  const ListTileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Card(child: ListTile(title: Text('One-line ListTile'))),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('One-line with leading widget'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('One-line with trailing widget'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('One-line with both widgets'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('One-line dense ListTile'),
            dense: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Two-line ListTile'),
            subtitle: Text('Here is a second line'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Three-line ListTile'),
            subtitle:
              Text('A sufficiently long subtitle warrants three lines.'),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}

class ListTileWithDivider extends StatelessWidget {
  const ListTileWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ListTile(
          leading: CircleAvatar(child: Text('A')),
          title: Text('Headline'),
          subtitle: Text('Supporting text'),
          trailing: Icon(Icons.favorite_rounded),
        ),
        Divider(height: 0),
        ListTile(
          leading: CircleAvatar(child: Text('B')),
          title: Text('Headline'),
          subtitle: Text(
              'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
          trailing: Icon(Icons.favorite_rounded),
        ),
        Divider(height: 0),
        ListTile(
          leading: CircleAvatar(child: Text('C')),
          title: Text('Headline'),
          subtitle: Text(
              "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text."),
          trailing: Icon(Icons.favorite_rounded),
          isThreeLine: true,
        ),
        Divider(height: 0),
      ],
    );
  }
}

class ListTileCustomization extends StatefulWidget {
  const ListTileCustomization({super.key});

  @override
  State<ListTileCustomization> createState() => _ListTileListTileCustomization();
}

class _ListTileListTileCustomization extends State<ListTileCustomization> {
  bool _selected = false;
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          enabled: _enabled,
          selected: _selected,
          onTap: () {
            setState(() {
              // This is called when the user toggles the switch.
              _selected = !_selected;
            });
          },
          iconColor:
              const WidgetStateColor.fromMap(<WidgetStatesConstraint, Color>{
            WidgetState.disabled: Colors.red,
            WidgetState.selected: Colors.green,
            WidgetState.any: Colors.black,
          }),
          // The same can be achieved using the .resolveWith() constructor.
          // The text color will be identical to the icon color above.
          textColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.red;
            }
            if (states.contains(WidgetState.selected)) {
              return Colors.green;
            }
            return Colors.black;
          }),
          leading: const Icon(Icons.person),
          title: const Text('Headline'),
          subtitle: Text('Enabled: $_enabled, Selected: $_selected'),
          trailing: Switch(
            onChanged: (bool? value) {
              // This is called when the user toggles the switch.
              setState(() {
                _enabled = value!;
              });
            },
            value: _enabled,
          ),
        ),
      ],
    );
  }
}

class ListTileAlignment extends StatefulWidget {
  const ListTileAlignment({super.key});

  @override
  State<ListTileAlignment> createState() => _ListTileAlignmentState();
}

class _ListTileAlignmentState extends State<ListTileAlignment> {
  ListTileTitleAlignment? titleAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(),
        ListTile(
          titleAlignment: titleAlignment,
          leading: Checkbox(
            value: true,
            onChanged: (bool? value) {},
          ),
          title: const Text('Headline Text'),
          subtitle: const Text(
              'Tapping on the trailing widget will show a menu that allows you to change the title alignment. The title alignment is set to threeLine by default if `ThemeData.useMaterial3` is true. Otherwise, defaults to titleHeight.'),
          trailing: PopupMenuButton<ListTileTitleAlignment>(
            onSelected: (ListTileTitleAlignment? value) {
              setState(() {
                titleAlignment = value;
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<ListTileTitleAlignment>>[
              const PopupMenuItem<ListTileTitleAlignment>(
                value: ListTileTitleAlignment.threeLine,
                child: Text('threeLine'),
              ),
              const PopupMenuItem<ListTileTitleAlignment>(
                value: ListTileTitleAlignment.titleHeight,
                child: Text('titleHeight'),
              ),
              const PopupMenuItem<ListTileTitleAlignment>(
                value: ListTileTitleAlignment.top,
                child: Text('top'),
              ),
              const PopupMenuItem<ListTileTitleAlignment>(
                value: ListTileTitleAlignment.center,
                child: Text('center'),
              ),
              const PopupMenuItem<ListTileTitleAlignment>(
                value: ListTileTitleAlignment.bottom,
                child: Text('bottom'),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              title: title,
              user: user,
              viewCount: viewCount,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$viewCount views',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}

class CustomListItemExample extends StatelessWidget {
  const CustomListItemExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Add other widgets here if needed
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            CustomListItem(
              user: 'Flutter',
              viewCount: 999000,
              thumbnail: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                ),
              ),
              title: 'The Flutter YouTube Channel',
            ),
            CustomListItem(
              user: 'Dash',
              viewCount: 884000,
              thumbnail: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.yellow),
                ),
              ),
              title: 'Announcing Flutter 1.0',
            ),
          ],
        ),
      ],
    );
  }
}