import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Common Buttons')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
              'Clickable blocks that perform an action, such as sending an email, sharing a document, or liking the comment.',
              style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ButtonTypesExample(),
            // Add more widgets as needed
          ],
        ),
      ),
    );
  }
}

class ButtonTypesExample extends StatelessWidget {
  const ButtonTypesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Spacer(),
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
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Elevated'),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                  }
                  return null; // Use the component's default.
                },
              ),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white), // text color
              padding: WidgetStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              textStyle: WidgetStateProperty.all<TextStyle>(
                TextStyle(fontSize: 16),
              ),
            ),
          ),
          FilledButton(
            onPressed: onPressed,
            child: const Text('Filled'),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green, // background color
              foregroundColor: Colors.white, // text color
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          FilledButton.tonal(
            onPressed: onPressed,
            child: const Text('Filled Tonal'),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.orange, // background color
              foregroundColor: Colors.white, // text color
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          OutlinedButton(
            onPressed: onPressed,
            child: const Text('Outlined'),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red, // text color
              side: BorderSide(color: Colors.red), // border color
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text('Text'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.purple, // text color
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}