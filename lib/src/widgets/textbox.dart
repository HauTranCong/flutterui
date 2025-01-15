import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

Widget textBox(String inputText, {double inputFontSize = 18, String? url, double padding = 8}) {
    return Padding(
        padding: EdgeInsets.all(padding),
        child: Align(
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
            )),
        ),
    );
}