import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class IconButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icon Button')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            textBox('Clickable icons to prompt app users to take supplementay actions.', inputFontSize: 18),
            SizedBox(height: 24),
            textBox('#', inputFontSize: 18, url: 'https://m3.material.io/components/icon-buttons/overview'),
            SizedBox(height: 24),
            IconButtonVolume(),
            SizedBox(height: 24),
            IconButtonFilledBackgound(),
            SizedBox(height: 24),
            ButtonTypesM3(),
            SizedBox(height: 24),
            DemoIconToggleButtons(),
          ],
        ),
      ),
    );
  }
}

class IconButtonVolume extends StatefulWidget {
  @override
  _IconButtonVolumeState createState() => _IconButtonVolumeState();
}

class _IconButtonVolumeState extends State<IconButtonVolume> {
  int _volume = 0;

  void _increaseVolume() {
    setState(() {
      _volume += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.volume_down, size: 72),
              onPressed: () {
                setState(() {
                  _volume -= 10;
                  if(_volume <= 0) _volume = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.volume_up, size: 72),
              onPressed: _increaseVolume,
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.volume_mute, size: 72),
          onPressed: () {
            setState(() {
              _volume = 0;
            });
          },
        ),
        Text('Volume: $_volume'),
      ],
    );
  }
}

class IconButtonFilledBackgound extends StatelessWidget {
  const IconButtonFilledBackgound({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textBox('Icon Button with filled background', inputFontSize: 18),
          SizedBox(width: 16),
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.android),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonTypesM3 extends StatelessWidget {
  const ButtonTypesM3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Spacer(),
          textBox('Icon Button Types - Material Design 3', inputFontSize: 18),
          SizedBox(height: 16),
          ButtonTypesGroup(enabled: true),
          ButtonTypesGroup(enabled: false),
          Spacer(),
        ],
      ),
    );
  }
}

class ButtonTypesGroup extends StatelessWidget {
  const ButtonTypesGroup({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: const Icon(Icons.filter_drama), onPressed: onPressed),

          // Filled icon button
          IconButton.filled(
              onPressed: onPressed, icon: const Icon(Icons.filter_drama)),

          // Filled tonal icon button
          IconButton.filledTonal(
              onPressed: onPressed, icon: const Icon(Icons.filter_drama)),

          // Outlined icon button
          IconButton.outlined(
              onPressed: onPressed, icon: const Icon(Icons.filter_drama)),
        ],
      ),
    );
  }
}

class DemoIconToggleButtons extends StatefulWidget {
  const DemoIconToggleButtons({super.key});

  @override
  State<DemoIconToggleButtons> createState() => _DemoIconToggleButtonsState();
}

class _DemoIconToggleButtonsState extends State<DemoIconToggleButtons> {
  bool standardSelected = false;
  bool filledSelected = false;
  bool tonalSelected = false;
  bool outlinedSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textBox('Standard Icon Button', inputFontSize: 18),
            const SizedBox(width: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  isSelected: standardSelected,
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  onPressed: () {
                    setState(() {
                      standardSelected = !standardSelected;
                    });
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  isSelected: standardSelected,
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textBox('Filled Icon Button', inputFontSize: 18),
            const SizedBox(width: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton.filled(
                  isSelected: filledSelected,
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  onPressed: () {
                    setState(() {
                      filledSelected = !filledSelected;
                    });
                  },
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  isSelected: filledSelected,
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textBox('Filled Tonal Icon Button', inputFontSize: 18),
            const SizedBox(width: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton.filledTonal(
                  isSelected: tonalSelected,
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  onPressed: () {
                    setState(() {
                      tonalSelected = !tonalSelected;
                    });
                  },
                ),
                const SizedBox(width: 10),
                IconButton.filledTonal(
                  isSelected: tonalSelected,
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textBox('Outlined Icon Button', inputFontSize: 18),
            const SizedBox(width: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton.outlined(
                  isSelected: outlinedSelected,
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  onPressed: () {
                    setState(() {
                      outlinedSelected = !outlinedSelected;
                    });
                  },
                ),
                const SizedBox(width: 10),
                IconButton.outlined(
                  isSelected: outlinedSelected,
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
