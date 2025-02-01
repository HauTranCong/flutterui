import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/src/core/dependency_injection/price_getter.dart';
import 'package:flutterui/src/widgets/textbox.dart';
import 'package:url_launcher/url_launcher.dart';

class DependencyInjection extends StatelessWidget {
  const DependencyInjection({super.key});

  @override
  Widget build(BuildContext context) {
    final priceGetter = PriceGetter(); // Create the dependency here

    return Scaffold(
      appBar: AppBar(
        title: Text('Dependency Injection'),
      ),
      body: Center(
        child: Column(
          children: [
            textBox('In software engineering, dependency injection is a programming technique in which an object or function receives other objects or functions that it requires, as opposed to creating them internally.'),
            Image.asset(
              'assets/images/dependency_injection.jpeg',
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            RichText(
              text: TextSpan(
                text: 'Dependency Injection',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse('https://www.freecodecamp.org/news/a-quick-intro-to-dependency-injection-what-it-is-and-when-to-use-it-7578c84fa88f/'));
                  },
              ),
            ),
            textBox("Dependency injection is often used alongside specialized frameworks, known as 'containers', to facilitate program composition"),
            Divider(),
            textBox('This example demonstrates dependency injection in Flutter. The DisplayBtcPrice widget receives a PriceGetter object that fetches the current Bitcoin price from an API.'),
            DisplayBtcPrice(priceGetter: priceGetter),
          ],
        ),// Inject the dependency
      ),
    );
  }
}

class DisplayBtcPrice extends StatefulWidget {
  final PriceGetter priceGetter;

  const DisplayBtcPrice({super.key, required this.priceGetter});

  @override
  _DisplayBtcPriceState createState() => _DisplayBtcPriceState();
}

class _DisplayBtcPriceState extends State<DisplayBtcPrice> {
  double? _btcPrice;
  bool _isLoading = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchBtcPrice();
    _startAutoUpdate();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoUpdate() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      _fetchBtcPrice();
    });
  }

  Future<void> _fetchBtcPrice() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final price = await widget.priceGetter.getBitcoinPrice();
      setState(() {
        _btcPrice = price;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error appropriately here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator()
          : Text('Bitcoin BTC: \$${_btcPrice?.toStringAsFixed(2) ?? 'Error'}',
              style: TextStyle(fontSize: 48)),
    );
  }
}