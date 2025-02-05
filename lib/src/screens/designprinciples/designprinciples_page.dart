import 'package:flutter/material.dart';
import 'dependency_injection.dart';
import 'mvc/mvc_views.dart';
import 'mvvm/mvvm_viewmodel.dart';
import 'bloc/bloc_view.dart';
import 'provider/provider_pattern.dart';
import 'singleton/singleton_view.dart';

class DesignPrinciplesPage extends StatelessWidget {
  final List<String> pages = const [
    'Dependency Injection',
    'Models-Views-Controllers',
    'Model-View-ViewModel',
    'Provider Pattern',
    'Bloc Pattern',
    'Singleton Pattern',
  ];

  final List<String> subtitles = const [
    'Dependency Injection is a design pattern that allows objects to receive their dependencies from external sources instead of creating them internally',
    'MVC is a software architectural pattern that separates an application into three main logical components: Model, View, and Controller',
    'MVVM (Model-View-ViewModel) is a software architecture pattern that helps separate UI (View) from business logic (Model) using an intermediary called ViewModel',
    'Provider Pattern is a state management pattern that allows sharing data between widgets without passing it explicitly',
    'The BLoC (Business Logic Component) Pattern in Flutter is a state management approach that separates UI and business logic using streams and the bloc package',
    'Singleton Pattern is a design pattern that restricts the instantiation of a class to one object, providing a global point of access to the object',
  ];

  final List<Widget> pageWidgets = [
    DependencyInjection(),
    MVC(),
    MVVM(),
    ProviderPattern(),
    BlocPattern(),
    SingletonPattern(),
  ];

  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = viewWidth > 1200 ? 4 : viewWidth > 800 ? 4 : 2;
    double childAspectRatio = viewWidth > 1200 ? 2 : viewWidth > 800 ? 1.5 : 1;

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return HoverCard(
            title: pages[index],
            subtitle: subtitles[index],
            page: pageWidgets[index],
          );
        },
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget page;

  const HoverCard({required this.title, required this.subtitle, required this.page});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget.page,
                ),
              );
            },
            // splashColor: Colors.blue.withAlpha(30),
            child: Padding(
            padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxWidth * 0.075,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      // color: Colors.grey,
                      fontSize: constraints.maxWidth * 0.0325,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}