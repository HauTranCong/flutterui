import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class SnackbarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            textBox(
              'Snackbars provide brief messages about app processes at the bottom of the screen.',
              inputFontSize: 24,
            ),
            textBox(
              '#',
              inputFontSize: 24,
              url: 'https://m3.material.io/components/snackbars/overview',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('This is a snackbar'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  ),
                );
              },
              child: Text('Show Snackbar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Show Snackbar with customizations'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    action: SnackBarAction(
                      label: 'Action',
                      onPressed: () {
                        // Code to execute.
                      },
                    ),
                    content: const Text('Awesome SnackBar!'),
                    duration: const Duration(milliseconds: 1500),
                    width: 280.0, // Width of the SnackBar.
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, // Inner padding for SnackBar content.
                    ),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SnackBarWithOptionExample extends StatefulWidget {
  const SnackBarWithOptionExample({super.key});

  @override
  State<SnackBarWithOptionExample> createState() => _SnackBarWithOptionExampleState();
}

class _SnackBarWithOptionExampleState extends State<SnackBarWithOptionExample> {
  SnackBarBehavior? _snackBarBehavior = SnackBarBehavior.floating;
  bool _withIcon = true;
  bool _withAction = true;
  bool _multiLine = false;
  bool _longActionLabel = false;
  double _sliderValue = 0.25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar Sample')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(_snackBar());
        },
        icon: const Icon(Icons.play_arrow),
        label: const Text('Show Snackbar'),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: const Text('Behavior'),
            initiallyExpanded: true,
            children: <Widget>[
              RadioListTile<SnackBarBehavior>(
                title: const Text('Fixed'),
                value: SnackBarBehavior.fixed,
                groupValue: _snackBarBehavior,
                onChanged: (SnackBarBehavior? value) {
                  setState(() {
                    _snackBarBehavior = value;
                  });
                },
              ),
              RadioListTile<SnackBarBehavior>(
                title: const Text('Floating'),
                value: SnackBarBehavior.floating,
                groupValue: _snackBarBehavior,
                onChanged: (SnackBarBehavior? value) {
                  setState(() {
                    _snackBarBehavior = value;
                  });
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Content'),
            initiallyExpanded: true,
            children: <Widget>[
              SwitchListTile(
                title: const Text('Include close Icon'),
                value: _withIcon,
                onChanged: (bool value) {
                  setState(() {
                    _withIcon = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Multi Line Text'),
                value: _multiLine,
                onChanged: (bool value) {
                  setState(() {
                    _multiLine = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Include Action'),
                value: _withAction,
                onChanged: (bool value) {
                  setState(() {
                    _withAction = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Long Action Label'),
                value: _longActionLabel,
                onChanged: !_withAction
                    ? null
                    : (bool value) => setState(() {
                          _longActionLabel = value;
                        }),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Action new-line overflow threshold'),
            initiallyExpanded: true,
            children: <Widget>[
              Slider(
                value: _sliderValue,
                divisions: 20,
                label: _sliderValue.toStringAsFixed(2),
                onChanged: (double value) => setState(() {
                  _sliderValue = value;
                }),
              ),
            ],
          ),
          // Avoid hiding content behind the floating action button
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  SnackBar _snackBar() {
    final SnackBarAction? action = _withAction
        ? SnackBarAction(
            label: _longActionLabel ? 'Long Action Text' : 'Action',
            onPressed: () {
              // Code to execute.
            },
          )
        : null;
    final double? width =
        _snackBarBehavior == SnackBarBehavior.floating ? 400.0 : null;
    final String label = _multiLine
        ? 'A Snack Bar with quite a lot of text which spans across multiple '
            'lines. You can look at how the Action Label moves around when trying '
            'to layout this text.'
        : 'Single Line Snack Bar';
    return SnackBar(
      content: Text(label),
      showCloseIcon: _withIcon,
      width: width,
      behavior: _snackBarBehavior,
      action: action,
      duration: const Duration(seconds: 3),
      actionOverflowThreshold: _sliderValue,
    );
  }
}