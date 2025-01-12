import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class SegmentButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segment Button')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            textBox('Segmented buttons help people select options, switch views, or sort elements.', inputFontSize: 18),
            SizedBox(height: 24),
            textBox('#', inputFontSize: 18, url: 'https://m3.material.io/components/segmented-buttons/overview'),
            SizedBox(height: 24),
            SingleChoice(),
          ],
        ),
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Selected view: ${calendarView.toString().split('.').last}',style: TextStyle(fontSize: 18)),
          SizedBox(height: 24),
          SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
                icon: Icon(Icons.calendar_view_day)),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                label: Text('Week'),
                icon: Icon(Icons.calendar_view_week)),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                label: Text('Month'),
                icon: Icon(Icons.calendar_view_month)),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                label: Text('Year'),
                icon: Icon(Icons.calendar_today)),
              ],
              selected: <Calendar>{calendarView},
              onSelectionChanged: (Set<Calendar> newSelection) {
              setState(() {
                // By default there is only a single segment that can be
                // selected at one time, so its value is always the first
                // item in the selected set.
                calendarView = newSelection.first;
              });
            },
          ),
        ],
      ),
    );
  }
}
