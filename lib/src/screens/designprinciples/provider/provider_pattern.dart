import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_class.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class ProviderPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpensesProvider(), // Provide at the top level
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider Pattern'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Image.network('https://miro.medium.com/v2/resize:fit:1400/format:webp/1*Dp6C1QBGPLnFctORNHc_1A.png'),
              ),
              textBox('The Provider Pattern is a design pattern commonly used in Flutter applications for state management.'),
              textBox('Providers: Objects that hold and expose state or services'),
              textBox('Consumers: Widgets that listen to and rebuild when the state changes'),
              textBox('Context-based Dependency Injection: Providers are injected at a higher level in the widget tree.'),
              Divider(),
              Card(child: ProviderUIUpdate()), // Child widget consuming provider
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}


class ProviderUIUpdate extends StatefulWidget {
  @override
  ProviderUIUpdateState createState() => ProviderUIUpdateState();
}

class ProviderUIUpdateState extends State<ProviderUIUpdate> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<ExpensesProvider>(context, listen: false).fetchRecentExpenses();
      setState(() {
        _isLoading = false; // Update state after fetching data
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesProvider>(
      builder: (context, expensesProvider, child) {
        if (_isLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(), // Show loader while fetching
                SizedBox(height: 16),
                Text("This example simulates fetching data from a database for 10 seconds. Provider notifies the UI when data is available."),
              ],
            ),
          );
        }
        if (expensesProvider.recentExpenses.isEmpty) {
          return Center(child: Text("No expenses available"));
        }
        return ListView.builder(
          shrinkWrap: true, // Important: prevents overflow in SingleChildScrollView
          physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
          itemCount: expensesProvider.recentExpenses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(expensesProvider.recentExpenses[index].name),
              subtitle: Text("\$${expensesProvider.recentExpenses[index].amount.toStringAsFixed(2)}"),
            );
          },
        );
      },
    );
  }
}

