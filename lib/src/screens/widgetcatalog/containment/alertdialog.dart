import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class AlertDialogScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Alert Dialog'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: <Widget>[
                        textBox('Dialogs provide important prompts in a user flow.', inputFontSize: 20),
                        textBox('#', inputFontSize: 20, url: 'https://m3.material.io/components/dialogs/overview'),
                        DialogExample(),
                        SizedBox(height: 16),
                        FullScreenDialogExample(),
                    ],
                ),
            ),
        );
    }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blueAccent,
      ),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text(
        'Show Dialog',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class FullScreenDialogExample extends StatelessWidget {
    const FullScreenDialogExample({super.key});

    @override
    Widget build(BuildContext context) {
        return TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.greenAccent,
            ),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => Scaffold(
                        appBar: AppBar(
                            title: const Text('Full Screen Dialog'),
                        ),
                        body: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    const Text('This is a full screen dialog'),
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Close Dialog'),
                                    ),
                                ],
                            ),
                        ),
                    ),
                    fullscreenDialog: true,
                ),
            ),
            child: const Text(
                'Show Full Screen Dialog',
                style: TextStyle(color: Colors.white),
            ),
        );
    }
}