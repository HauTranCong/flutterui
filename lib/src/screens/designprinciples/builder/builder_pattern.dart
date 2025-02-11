import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'package:flutterui/src/widgets/codecard.dart';

class BuilderPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory Pattern'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            textBox('''The Builder Pattern is a creational design pattern used
                to construct complex objects step by step. It allows creating 
                different representations of an object using the same
                construction process.'''),
            Divider(),
            textBox('When Use Builder Pattern?'),
            textBox('''1. When an object has too many optional parameters 
                (avoids telescoping constructor problem).'''),
            textBox('''2. When the construction process involves multiple steps
                or variants.'''),
            textBox('''3. When the object is immutable but needs a flexible way
                to configure it.'''),
            Divider(),
            textBox('Structure of the Builder Pattern'),
            textBox('''1. Product – The complex object being built.'''),
            textBox('''2. Builder Interface – Defines methods for step-by-step 
                construction.'''),
            textBox('''3. Concrete Builder – Implements the builder interface, 
                maintains the product’s state.'''),
            textBox('''4. Director (Optional) – Controls the construction 
                sequence.'''),
            textBox('''5. Client – Uses the builder to construct the object.'''),
            Divider(),
            textBox('Example in Dart'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/builder/car_builder.dart'),
            Divider(),
            textBox('Example in C++'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/builder/car_builder.cpp'),
            Divider(),
          ],
        ),
      ),
    );
  }
}
