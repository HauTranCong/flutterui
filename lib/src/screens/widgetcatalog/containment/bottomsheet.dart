import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class BottomSheetScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Bottom Sheet'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: [
                        textBox('Bottom sheets show secondary content anchored to the bottom of the screen.', inputFontSize: 24),
                        SizedBox(height: 10),
                        textBox('#', inputFontSize: 24, url: 'https://m3.material.io/components/bottom-sheets/overview'),
                        SizedBox(height: 10),
                        textBox('   ? Bottom sheets should not be full width in WebApp, considering DiagLog', inputFontSize: 24),
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () => _showBottomSheet(context),
                            child: Text('Show Bottom Sheet'),
                        ),
                    ],
                ),
            ),
        );
    }
}

void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                    return Align(
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                    Text('Bottom Sheet'),
                                    ElevatedButton(
                                        child: const Text('Close Bottom Sheet'),
                                        onPressed: () => Navigator.pop(context),
                                    ),
                                ],
                            ),
                        ),
                    );
                },
            );
        },
    );
}