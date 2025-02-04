import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'bloc_state.dart';
import 'bloc_event.dart';
import 'counter_bloc.dart';

class BlocPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bloc Pattern'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Image.network('https://images.viblo.asia/full/69b491a2-f2a6-4887-b2f5-0a4acb0a794a.png'),
              ),
              RichText(
                text: TextSpan(
                  text: 'Using Provider Pattern',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse('https://viblo.asia/p/hoc-bloc-pattern-theo-cach-de-hieu-nhat-maGK7JYO5j2'));
                    },
                ),
              ),
              textBox('Flutter BLoC (Business Logic Component) is used to manage the state. It helps separate business logic from UI. It ensures that the user interface is not strongly liaison with the business logic'),
              textBox('Streams: Streams help in managing user actions and data and how it flows through your app. In simple words, streams are like rivers which carry messages(messages can be anything, such as user actions or data updates)'),
              textBox("Sink: It's where you input data that you want to process. Data is poured into the sink, which then travels through it. A sink is like a place where you pour water into the stream"),
              textBox("Stream Controller: A Stream Controller helps manage the streams, sinks and data, ensuring that data flows correctly through the system. In other words, it is a controller that controls the flow of water in the streams"),
              textBox("Stream Builder: It updates the UI on the based of latest data in the stream. It updates the part of the app it's watching whenever new data comes down the stream through the sink. It's like a watchman that keeps an eye on the stream."),
              Divider(),
              Card(
                margin: EdgeInsets.all(16.0),
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2, // Adjust height dynamically
                        child: MyApp(),
                    ),
                ),
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('Updating Counter via Bloc: ${state.counterValue}', style: TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(Increment()),
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(Decrement()),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
