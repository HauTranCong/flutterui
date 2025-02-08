import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

Widget textBox(String inputText,
    {double inputFontSize = 18,
    String? url,
    double padding = 8,
    alignment = Alignment.centerLeft}) {
  // Remove surrounding single quotes or triple single quotes
  inputText = inputText.replaceAll(RegExp(r'\s+'), ' ').trim();

  return Padding(
    padding: EdgeInsets.all(padding),
    child: Align(
      alignment: alignment,
      child: SelectableText.rich(TextSpan(
        style: TextStyle(fontSize: inputFontSize),
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
              style: TextStyle(fontSize: inputFontSize),
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
      )),
    ),
  );
}
