import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'package:flutterui/src/widgets/codecard.dart';

class FactoryPattern extends StatelessWidget {
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
            textBox('''The Factory Pattern is a creational design pattern that 
                provides an interface for creating objects in a superclass but 
                allows subclasses to alter the type of objects that will 
                be created. It helps in encapsulating object creation logic, 
                promoting code flexibility and reusability.'''),
            Divider(),
            textBox('Why Use Factory Pattern?'),
            textBox('''1. Encapsulation of Object Creation – Hides object 
                instantiation logic from the client.'''),
            textBox('''2. Loose Coupling – Clients depend on an interface, 
                not a specific implementation.'''),
            textBox('''3. Simplified Maintenance – Changes in object creation 
                logic don’t affect client code.'''),
            textBox('''4. Encapsulation of Complex Object Creation – 
                If object creation involves multiple steps, a factory method 
                helps keep it manageable.'''),
            Divider(),
            textBox('1. Simple Factory (Static Factory Method)'),
            textBox('''- Not a true design pattern, but a common pattern 
                for object creation.'''),
            textBox('''- Uses a static method to return instances of different 
                subclasses based on input.'''),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/factory/simple_factory.dart'),
            Divider(),
            textBox('2. Factory Method Pattern'),
            textBox('''- Uses an interface or abstract class for 
                object creation.'''),
            textBox('''- Subclasses override a method to 
                create specific objects.'''),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/factory/method_factory.dart'),
            Divider(),
            textBox('3. Abstract Factory Pattern'),
            textBox('''- Factory of factories; used to create families of 
                related objects without specifying their concrete classes.'''),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/factory/abstract_factory.dart'),
            Divider(),
          ],
        ),
      ),
    );
  }
}
