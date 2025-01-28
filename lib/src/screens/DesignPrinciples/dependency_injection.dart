import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterui/src/core/dependency_injection/price_getter.dart';

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
        child: DisplayBtcPrice(priceGetter: priceGetter), // Inject the dependency
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Access the state of DisplayBtcPrice and call _fetchBtcPrice
      //     final state = context.findAncestorStateOfType<_DisplayBtcPriceState>();
      //     state?._fetchBtcPrice();
      //   },
      //   child: Icon(Icons.refresh),
      // ),
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