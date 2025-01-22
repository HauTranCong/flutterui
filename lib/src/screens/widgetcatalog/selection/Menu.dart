import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'MenuButton.dart';
import 'MenuClick.dart';


class MenuScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Menu'),
                actions: const <Widget>[
                    MyCascadingMenu(),
                ],
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: [
                        textBox(
                            'Menu is a list of choices that appears when the user interacts with a button, action, or other control.',
                            inputFontSize: 24,
                        ),
                        SizedBox(height: 16),
                        textBox(
                            '#',
                            inputFontSize: 24,
                            url: 'https://m3.material.io/components/menus/overview',
                        ),
                        SizedBox(height: 16),
                        Card(
                            margin: EdgeInsets.all(16.0),
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.75, // Adjust height dynamically
                                    child: MenuApp(),
                                ),
                            ),
                            color: Colors.grey[300],
                        ),
                        Card(
                            margin: EdgeInsets.all(16.0),
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.75, // Adjust height dynamically
                                    child: MenuAppRigtClick(),
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

class MyCascadingMenu extends StatefulWidget {
  const MyCascadingMenu({super.key});

  @override
  State<MyCascadingMenu> createState() => _MyCascadingMenuState();
}

class _MyCascadingMenuState extends State<MyCascadingMenu> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {},
          child: const Text('Revert'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Setting'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const Text('Send Feedback'),
        ),
      ],
      builder: (_, MenuController controller, Widget? child) {
        return IconButton(
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
        );
      },
    );
  }
}