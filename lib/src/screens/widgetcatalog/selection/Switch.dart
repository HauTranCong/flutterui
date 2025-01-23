import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class SwitchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textBox("Simple toggle on/off: "),
                      SizedBox(width: 24),
                      SwitchExample1(),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textBox("Switch with WidgetStateProperty: "),
                      SizedBox(width: 24),
                      SwitchExample2(),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textBox("Switch using the Switch.thumbIcon property: "),
                      SizedBox(width: 24),
                      SwitchExample3(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchExample1 extends StatefulWidget {
  const SwitchExample1({super.key});

  @override
  State<SwitchExample1> createState() => _SwitchExample1State();
}

class _SwitchExample1State extends State<SwitchExample1> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.red,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

class SwitchExample2 extends StatefulWidget {
  const SwitchExample2({super.key});

  @override
  State<SwitchExample2> createState() => _SwitchExample2State();
}

class _SwitchExample2State extends State<SwitchExample2> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    // This object sets amber as the track color when the switch is selected.
    // Otherwise, it resolves to null and defers to values from the theme data.
    const WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty<Color?>.fromMap(
      <WidgetStatesConstraint, Color>{
        WidgetState.selected: Colors.amber,
      },
    );
    // This object sets the track color based on two WidgetState attributes.
    // If neither state applies, it resolves to null.
    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty<Color?>.fromMap(
      <WidgetState, Color>{
        WidgetState.selected: Colors.amber.withOpacity(0.54),
        WidgetState.disabled: Colors.grey.shade400,
      },
    );

    return Switch(
      // This bool value toggles the switch.
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

class SwitchExample3 extends StatefulWidget {
  const SwitchExample3({super.key});

  @override
  State<SwitchExample3> createState() => _SwitchExample3State();
}

class _SwitchExample3State extends State<SwitchExample3> {
  bool light0 = true;
  bool light1 = true;

  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.check),
      WidgetState.any: Icon(Icons.close),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          value: light0,
          onChanged: (bool value) {
            setState(() {
              light0 = value;
            });
          },
        ),
        Switch(
          thumbIcon: thumbIcon,
          value: light1,
          onChanged: (bool value) {
            setState(() {
              light1 = value;
            });
          },
        ),
      ],
    );
  }
}
