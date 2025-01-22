import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class DatePickerScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Date Picker'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: [
                        textBox(
                            'Date Picker allows users to select a date from a calendar',
                            inputFontSize: 24,
                        ),
                        SizedBox(height: 16),
                        textBox(
                            '#',
                            inputFontSize: 24,
                            url: 'https://m3.material.io/components/date-pickers/overview',
                        ),
                        SizedBox(height: 16),
                        Card(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                        Text(
                                            'Date Picker Example:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        SizedBox(height: 8),
                                        DockedDatePicker(),
                                    ],
                                ),
                            ),
                        ),

                        Card(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Modal Date Picker Example:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        SizedBox(height: 8),
                                        ModalDatePicker(),
                                    ],
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}

class DockedDatePicker extends StatefulWidget {
    @override
    _ockedDDatePickerState createState() => _ockedDDatePickerState();
}

class _ockedDDatePickerState extends State<DockedDatePicker> {
    DateTime _selectedDate = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2077),
        );
        if (picked != null && picked != _selectedDate)
            setState(() {
                _selectedDate = picked;
            });
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                    'Selected Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date'),
                ),
            ],
        );
    }
}

class ModalDatePicker extends StatefulWidget {
    @override
    _ModalDatePickerState createState() => _ModalDatePickerState();
}

class _ModalDatePickerState extends State<ModalDatePicker> {
    DateTimeRange? _selectedDateRange;

    Future<void> _selectDateRange(BuildContext context) async {
        final DateTimeRange? picked = await showDateRangePicker(
            context: context,
            firstDate: DateTime(2025),
            lastDate: DateTime(2030),
            initialDateRange: _selectedDateRange,
            builder: (BuildContext context, Widget? child) {
                return Theme(
                    data: Theme.of(context),
                    child: child!,
                );
            },
        );
        if (picked != null && picked != _selectedDateRange) {
            setState(() {
                _selectedDateRange = picked;
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                    _selectedDateRange == null
                        ? 'No date range selected'
                        : 'Selected Date Range: ${_selectedDateRange!.start.day}/${_selectedDateRange!.start.month}/${_selectedDateRange!.start.year} - ${_selectedDateRange!.end.day}/${_selectedDateRange!.end.month}/${_selectedDateRange!.end.year}',
                    style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                    onPressed: () => _selectDateRange(context),
                    child: Text('Select date range'),
                ),
            ],
        );
    }
}