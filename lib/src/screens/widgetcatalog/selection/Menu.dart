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