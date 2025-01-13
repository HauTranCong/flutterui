import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class LinearProgressIndicatorPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Linear Progress Indicator'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        LinearProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading...'),
                        SizedBox(height: 20),
                        ProgressIndicatorFixedColor(),
                        SizedBox(height: 20),
                        ProgressIndicatorWithDeterminate(),
                    ],
                ),
            ),
        );
    }
}

class ProgressIndicatorFixedColor extends StatefulWidget {
  const ProgressIndicatorFixedColor({super.key});

  @override
  State<ProgressIndicatorFixedColor> createState() =>
      _ProgressIndicatorFixedColorState();
}

class _ProgressIndicatorFixedColorState extends State<ProgressIndicatorFixedColor>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
            'Linear progress indicator with a fixed color',
            style: TextStyle(fontSize: 20),
          ),
          LinearProgressIndicator(
            value: controller.value,
            semanticsLabel: 'Linear progress indicator',
          ),
        ],
      ),
    );
  }
}

class ProgressIndicatorWithDeterminate extends StatefulWidget {
  const ProgressIndicatorWithDeterminate({super.key});

  @override
  State<ProgressIndicatorWithDeterminate> createState() =>
      _ProgressIndicatorWithDeterminateState();
}

class _ProgressIndicatorWithDeterminateState extends State<ProgressIndicatorWithDeterminate>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Linear progress indicator',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Determinate Mode',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Switch(
                  value: determinate,
                  onChanged: (bool value) {
                    setState(() {
                      determinate = value;
                      if (determinate) {
                        controller.stop();
                      } else {
                        controller
                          ..forward(from: controller.value)
                          ..repeat();
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
    );
  }
}
