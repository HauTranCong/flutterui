import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'package:flutterui/src/widgets/codecard.dart';

class SingletonPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Singleton Pattern'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            textBox(
                'Singleton is a design pattern that ensures a class has only one instance and provides a global access point to that instance'),
            textBox(
                '1. Lazy Singleton (Using a Private Constructor). When you want to initialize the instance only when needed.'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/singleton/lazy_singleton.dart'),
            textBox(
                '2. Eager Singleton (Using a Static Field). When the instance should be available as soon as the program starts.'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/singleton/eager_singleton.dart'),
            textBox(
                '3. Singleton with Dart’s static Getter. When you want a clean API like Singleton.instance.'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/singleton/eager_singleton_static.dart'),
            textBox(
                '4. Thread-Safe Singleton (For Multi-threaded Environments). Dealing with concurrency or isolates in Dart'),
            CodeCardFromAsset(
                assetPath:
                    'lib/src/screens/designprinciples/singleton/thread_safe_singleton.dart'),
            Divider(),
          ],
        ),
      ),
    );
  }
}
