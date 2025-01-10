import 'package:flutter/material.dart';

class FloatingActionButtonPage extends StatefulWidget {
  const FloatingActionButtonPage({super.key});

  @override
  State<FloatingActionButtonPage> createState() =>
      _FloatingActionButtonPageState();
}

class _FloatingActionButtonPageState
    extends State<FloatingActionButtonPage> {
  // The FAB's foregroundColor, backgroundColor, and shape
  static const List<(Color?, Color? background, ShapeBorder?)> customizations =
      <(Color?, Color?, ShapeBorder?)>[
    (null, null, null), // The FAB uses its default for null parameters.
    (null, Colors.green, null),
    (Colors.white, Colors.green, null),
    (Colors.white, Colors.green, CircleBorder()),
  ];
  int index = 0; // Selects the customization.

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    Widget titleBox(String title) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(title,
              style: TextStyle(color: colorScheme.onInverseSurface)),
        ),
      );
    }

    Widget textBox(String inputText, [double inputFontSize = 18]) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(inputText,
            style: TextStyle(fontSize: inputFontSize),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButton Sample'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            textBox('Use at most a single floating action button per screen. Floating action buttons should be used for positive actions such as "create", "share", or "navigate". (If more than one floating action button is used within a Route, then make sure that each button has a unique heroTag, otherwise an exception will be thrown.', 18),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Small'),
                const SizedBox(width: 16),
                // An example of the small floating action button.
                //
                // https://m3.material.io/components/floating-action-button/specs#669a1be8-7271-48cb-a74d-dd502d73bda4
                FloatingActionButton.small(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Regular'),
                const SizedBox(width: 16),
                // An example of the regular floating action button.
                //
                // https://m3.material.io/components/floating-action-button/specs#71504201-7bd1-423d-8bb7-07e0291743e5
                FloatingActionButton(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Large'),
                const SizedBox(width: 16),
                // An example of the large floating action button.
                //
                // https://m3.material.io/components/floating-action-button/specs#9d7d3d6a-bab7-47cb-be32-5596fbd660fe
                FloatingActionButton.large(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Extended'),
                const SizedBox(width: 16),
                // An example of the extended floating action button.
                //
                // https://m3.material.io/components/extended-fab/specs#686cb8af-87c9-48e8-a3e1-db9da6f6c69b
                FloatingActionButton.extended(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  label: const Text('Add'),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Surface color mapping.
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FloatingActionButton.large(
                      foregroundColor: colorScheme.primary,
                      backgroundColor: colorScheme.surface,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: const Icon(Icons.edit_outlined),
                    ),
                    const SizedBox(height: 20),
                    titleBox('Surface'),
                  ],
                ),
                // Secondary color mapping.
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FloatingActionButton.large(
                      foregroundColor: colorScheme.onSecondaryContainer,
                      backgroundColor: colorScheme.secondaryContainer,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: const Icon(Icons.edit_outlined),
                    ),
                    const SizedBox(height: 20),
                    titleBox('Secondary'),
                  ],
                ),
                // Tertiary color mapping.
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FloatingActionButton.large(
                      foregroundColor: colorScheme.onTertiaryContainer,
                      backgroundColor: colorScheme.tertiaryContainer,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: const Icon(Icons.edit_outlined),
                    ),
                    const SizedBox(height: 20),
                    titleBox('Tertiary'),
                  ],
                ),
              ],
            ),
            // Add more widgets as needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = (index + 1) % customizations.length;
          });
        },
        foregroundColor: customizations[index].$1,
        backgroundColor: customizations[index].$2,
        shape: customizations[index].$3,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
