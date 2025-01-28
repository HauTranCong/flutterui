import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class OtherFilesType extends StatefulWidget {
  @override
  _OtherFilesTypeState createState() => _OtherFilesTypeState();
}

class _OtherFilesTypeState extends State<OtherFilesType> {
  final TextEditingController _controller = TextEditingController();
  String _responseText = '';

  Future<void> fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url)); // GET method
      if (response.statusCode == 200) {
        setState(() {
          _responseText = response.body;
        });
      } else {
        setState(() {
          _responseText = 'Error: ${response.statusCode}';
        });
      }
    } on SocketException {
      setState(() {
        _responseText = 'Network error: Failed to fetch data';
      });
    } on HttpException {
      setState(() {
        _responseText = 'HTTP error: Failed to fetch data';
      });
    } on FormatException {
      setState(() {
        _responseText = 'Format error: Bad response format';
      });
    } catch (e) {
      setState(() {
        _responseText = 'Unexpected error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Files Type'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter URL',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => fetchData(_controller.text),
              child: Text('Fetch Data'),
            ),
            SizedBox(height: 20),
            Text(_responseText),
          ],
        ),
      ),
    );
  }
}
