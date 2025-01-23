import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SliderWidget(),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: RangeSliderWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 50.0; // Initial value

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Value with divisions are 10: ${_sliderValue.toStringAsFixed(1)}",
          style: TextStyle(fontSize: 20),
        ),
        Slider(
          value: _sliderValue,
          min: 0,
          max: 100,
          divisions: 10, // Optional: Creates ticks on the slider
          label: _sliderValue.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
        ),
      ],
    );
  }
}

class RangeSliderWidget extends StatefulWidget {
  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues _currentRangeValues = RangeValues(20, 80); // Initial values

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Range Slider: ${_currentRangeValues.start.toStringAsFixed(1)} - ${_currentRangeValues.end.toStringAsFixed(1)}",
          style: TextStyle(fontSize: 18),
        ),
        RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 100,
          divisions: 10, // Creates tick marks (optional)
          labels: RangeLabels(
            _currentRangeValues.start.toStringAsFixed(1),
            _currentRangeValues.end.toStringAsFixed(1),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
      ],
    );
  }
}
