import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'package:flutterui/src/widgets/codecard.dart';

class CompositePattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Composite Pattern'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            textBox('''The Composite Pattern is a structural design pattern 
                used to treat individual objects and compositions of 
                objects uniformly. It is particularly useful when dealing 
                with tree-like structures, such as hierarchical data 
                or organizational charts.'''),
            Divider(),
            textBox('When Use Composite Pattern?'),
            textBox('''1. Hierarchical Structures – Like file systems, UI 
                components, organization charts.'''),
            textBox('''2. Uniform Treatment – When individual and composite 
                objects should be handled the same way.'''),
            textBox('''3. Recursive Operations – If traversal or processing 
                naturally follows a tree structure.'''),
            textBox('''4. Scalability & Flexibility – Easy to extend by adding 
                new components.'''),
            Divider(),
            textBox('Structure of the Builder Pattern'),
            textBox(
                '''1. Component (Interface/Abstract Class): Defines the common 
                interface for all elements in the hierarchy.'''),
            textBox('''2. Leaf (Single Object): Represents individual objects 
                that do not contain sub-elements.'''),
            textBox('''3. Composite (Container Object): Represents objects 
                that contain other Component objects (both Leaf and other 
                Composite objects).'''),
            Divider(),
            textBox('Example in Dart'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/composite/hierarchy_composite.dart'),
            Divider(),
            textBox('Example in C++'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/composite/hierarchy_composite.cpp'),
            Divider(),
            textBox('Output'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/composite/output.md'),
            Divider(),
          ],
        ),
      ),
    );
  }
}
