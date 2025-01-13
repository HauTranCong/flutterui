import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class BadgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Badge')),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                children: [
                    textBox('Badges show notifications, counts, or status information on navigation items and icons', inputFontSize: 24),
                    textBox('#', inputFontSize: 24, url: 'https://m3.material.io/components/badges/overview'),
                    BadgeExample(),
                    SizedBox(height: 20),
                    BadgeCountExample(),
                ],
            ),
        ),
    );
  }
}

class BadgeExample extends StatelessWidget {
  const BadgeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: const Badge(
              label: Text('Your label'),
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.receipt),
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          IconButton(
            icon: Badge.count(
              count: 9999,
              child: const Icon(Icons.notifications),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class BadgeCountExample extends StatefulWidget {
  @override
  _BadgeCountExampleState createState() => _BadgeCountExampleState();
}

class _BadgeCountExampleState extends State<BadgeCountExample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textBox('Click on the notification icon to increase the count', inputFontSize: 24),
                IconButton(
                  icon: Badge.count(
                    count: _count,
                    child: const Icon(Icons.notifications),
                  ),
                  onPressed: () {
                    setState(() {
                      _count++;
                    });
                  },
                ),
              ],
            ),
          const SizedBox(height: 20),
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textBox('Click on the notification icon to decrease the count', inputFontSize: 24),
              IconButton(
                icon: Badge.count(
                  count: _count,
                  child: const Icon(Icons.notifications),
                ),
                onPressed: () {
                  setState(() {
                    _count--;
                  });
                },
              ),
            ]
          )
        ],
      ),
    );
  }
}