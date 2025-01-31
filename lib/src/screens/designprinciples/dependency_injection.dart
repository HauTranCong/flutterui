import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterui/src/core/dependency_injection/price_getter.dart';
import 'package:flutterui/src/widgets/textbox.dart';

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
            SizedBox(child: Image.network('https://cdn-media-1.freecodecamp.org/images/1*0P-1JhnUaZeobDUAajIbhA.jpeg')),
            textBox('In software engineering, dependency injection is a programming technique in which an object or function receives other objects or functions that it requires, as opposed to creating them internally.'),
            textBox('This example demonstrates dependency injection in Flutter. The DisplayBtcPrice widget receives a PriceGetter object that fetches the current Bitcoin price from an API.'),
            Divider(),
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