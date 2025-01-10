import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExtendedFloatingActionButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textBox(String inputText, {double inputFontSize = 18, String? url}) {
      return Align(
        alignment: Alignment.centerLeft,
        child: SelectableText.rich(
          TextSpan(
            style: TextStyle(fontSize: inputFontSize, color: Colors.black),
            children: [
              TextSpan(
                text: inputText,
                style: TextStyle(fontSize: inputFontSize),
              ),
              if (url != null) ...[
                TextSpan(
                  text: ' ',
                  style: TextStyle(fontSize: inputFontSize),
                ),
                TextSpan(
                  text: url,
                  style: TextStyle(fontSize: inputFontSize, color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                ),
              ],
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Extended Floating Action Button')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            textBox('An extended FAB is a versatile UI component that can improve the overall user experience by providing more information, enhancing accessibility, and maintaining design consistency.', inputFontSize: 18),
            SizedBox(height: 16),
            textBox('#', inputFontSize: 18, url: 'https://m3.material.io/components/extended-fab/specs'),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.center,
        child: ExtendedFloatingActionButton(
          icon: Icon(Icons.add),
          label: Text('Add'),
          onPressed: () {
            // Add your onPressed code here!
            print('Extended FAB pressed');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ExtendedFloatingActionButton extends StatelessWidget {
  final Widget icon;
  final Widget label;
  final VoidCallback onPressed;

  ExtendedFloatingActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: icon,
      label: label,
      onPressed: onPressed,
    );
  }
}