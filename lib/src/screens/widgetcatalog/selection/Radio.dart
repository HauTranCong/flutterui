import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ThemeScreen(
              child: Card(
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ThemeChangeWithRadioButton(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ThemeScreen extends StatefulWidget {
  final Widget child;

  ThemeScreen({required this.child});

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  ThemeData _themeData = ThemeData.light(); // Default theme

  void setTheme(ThemeMode themeMode) {
    setState(() {
      _themeData = themeMode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeData, // Apply local theme
      child: widget.child,
    );
  }
}

class ThemeChangeWithRadioButton extends StatefulWidget {
  @override
  _ThemeChangeWithRadioButtonState createState() => _ThemeChangeWithRadioButtonState();
}

class _ThemeChangeWithRadioButtonState extends State<ThemeChangeWithRadioButton> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: const Text('Light Theme'),
          leading: Radio<ThemeMode>(
            value: ThemeMode.light,
            groupValue: _themeMode,
            onChanged: (ThemeMode? value) {
              setState(() {
                _themeMode = value!;
                _changeTheme(context, _themeMode);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Dark Theme'),
          leading: Radio<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: _themeMode,
            onChanged: (ThemeMode? value) {
              setState(() {
                _themeMode = value!;
                _changeTheme(context, _themeMode);
              });
            },
          ),
        ),
        ListTile(
          title: const Text('System Default'),
          leading: Radio<ThemeMode>(
            value: ThemeMode.system,
            groupValue: _themeMode,
            onChanged: (ThemeMode? value) {
              setState(() {
                _themeMode = value!;
                _changeTheme(context, _themeMode);
              });
            },
          ),
        ),
      ],
    );
  }

  void _changeTheme(BuildContext context, ThemeMode themeMode) {
    final themeNotifier = context.findAncestorStateOfType<_ThemeScreenState>();
    themeNotifier?.setTheme(themeMode);
  }
}
