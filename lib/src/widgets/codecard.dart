import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CodeCardFromAsset extends StatefulWidget {
  final String assetPath;
  final String language;

  const CodeCardFromAsset(
      {super.key, required this.assetPath, this.language = "dart"});

  @override
  _CodeCardFromAssetState createState() => _CodeCardFromAssetState();
}

class _CodeCardFromAssetState extends State<CodeCardFromAsset> {
  String _code = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadCode();
  }

  void _loadCode() async {
    try {
      String fileContent = await rootBundle.loadString(widget.assetPath);
      setState(() {
        _code = fileContent;
      });
    } catch (e) {
      setState(() {
        _code = "Error reading file: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: HighlightView(
            _code,
            language: widget.language,
            theme: githubTheme,
            padding: const EdgeInsets.all(8),
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
