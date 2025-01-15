import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class DividerScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Divider'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: [
                        textBox(
                            'A thin, horizontal line used to divide content.',
                            inputFontSize: 24,
                        ),
                        textBox(
                            '#',
                            inputFontSize: 24,
                            url: 'https://api.flutter.dev/flutter/material/Divider-class.html',
                        ),
                        DividerExample(),
                        SizedBox(height: 16),
                        DividerBlock(),   
                    ],
                ),
            ),
        );
    }
}

class DividerExample extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Text('Above Divider'),
                Divider(
                    color: Colors.black,
                    height: 20,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                ),
                Text('Below Divider'),
            ],
        );
    }
}

class DividerBlock extends StatelessWidget {
  const DividerBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          height: 400, // Define a height for the SizedBox
          child: Column(
            children: <Widget>[
              Expanded(
                child: Card(
                  child: SizedBox.expand(),
                ),
              ),
              Divider(),
              Expanded(
                child: Card(
                  child: SizedBox.expand(),
                ),
              ),
            ],
          ),
        ),
    );
  }
}