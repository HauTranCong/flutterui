import 'package:http/http.dart' as http;
import 'dart:convert';

class PriceGetter {
  final String _apiUrl = 'https://api.coindesk.com/v1/bpi/currentprice/BTC.json';

  Future<double> getBitcoinPrice() async {
    final response = await http.get(Uri.parse(_apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['bpi']['USD']['rate_float'];
    } else {
      throw Exception('Failed to load Bitcoin price');
    }
  }
}