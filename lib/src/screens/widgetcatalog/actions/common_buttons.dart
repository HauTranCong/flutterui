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
          ElevatedButton(onPressed: onPressed, child: const Text('Elevated')),
          SizedBox(height: 16),
          FilledButton(onPressed: onPressed, child: const Text('Filled')),
          SizedBox(height: 16),
          FilledButton.tonal(
              onPressed: onPressed, child: const Text('Filled Tonal')),
          SizedBox(height: 16),
          OutlinedButton(onPressed: onPressed, child: const Text('Outlined')),
          SizedBox(height: 16),
          TextButton(onPressed: onPressed, child: const Text('Text')),
        ],
      ),
    );
  }
}
