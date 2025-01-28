import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FontsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Built-in Fonts Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Using default sans-serif font with bold style
              Text(
                'This is the default sans-serif font (bold).',
                style: TextStyle(
                  fontFamily: 'sans-serif', // Default sans-serif font
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Bold for better visibility
                ),
              ),
              SizedBox(height: 20),

              // Using default serif font with italic style
              Text(
                'This is the default serif font (italic).',
                style: TextStyle(
                  fontFamily: 'serif', // Default serif font
                  fontSize: 24,
                  fontStyle: FontStyle.italic, // Italic for better visibility
                ),
              ),
              SizedBox(height: 20),

              // Using monospace font with bold style
              Text(
                'This is the monospace font (bold).',
                style: TextStyle(
                  fontFamily: 'monospace', // Default monospace font
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Bold for better visibility
                ),
              ),
              SizedBox(height: 20),

              // Using a more distinct Google font, like Roboto
              Text(
                'This is the Roboto font (normal).',
                style: TextStyle(
                  fontFamily:
                      'Roboto', // Roboto is available by default in Flutter
                  fontSize: 24,
                  fontWeight: FontWeight.normal, // Normal weight
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
