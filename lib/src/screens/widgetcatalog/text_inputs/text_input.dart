import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class TextInputsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textBox('Obscured TextField'),
                Card(
                  margin: EdgeInsets.all(16),
                  child: ObscuredTextFieldSample(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textBox('OnSubmitted TextField'),
                Card(
                  margin: EdgeInsets.all(16),
                  child: TextFieldWithOnSubmitted(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ObscuredTextFieldSample extends StatelessWidget {
  const ObscuredTextFieldSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );
  }
}

class TextFieldWithOnSubmitted extends StatelessWidget {
  const TextFieldWithOnSubmitted({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldExample();
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        decoration: InputDecoration(hintText: 'Enter Text'),
        controller: _controller,
        onSubmitted: (String value) async {
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Thanks!'),
                content: Text(
                    'You typed "$value", which has length ${value.characters.length}.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
