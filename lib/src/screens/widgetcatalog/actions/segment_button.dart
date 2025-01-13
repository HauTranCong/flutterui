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
            SizedBox(height: 24),
            MultipleChoice(),
            SizedBox(height: 24),
            SegmentedButtonDecoration(),
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

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Selected sizes: ${selection.map((e) => e.toString().split('.').last).join(', ')}', style: TextStyle(fontSize: 18)),
        SizedBox(height: 24),
        SegmentedButton<Sizes>(
          segments: const <ButtonSegment<Sizes>>[
            ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
            ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
            ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
            ButtonSegment<Sizes>(
              value: Sizes.large,
              label: Text('L'),
            ),
            ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
          ],
          selected: selection,
          onSelectionChanged: (Set<Sizes> newSelection) {
            setState(() {
              selection = newSelection;
            });
          },
          multiSelectionEnabled: true,
        ),
      ],
    );
  }
}

class SegmentedButtonDecoration extends StatefulWidget {
  const SegmentedButtonDecoration({super.key});

  @override
  State<SegmentedButtonDecoration> createState() => _SegmentedButtonDecorationState();
}

enum CalendarDecoration { day, week, month, year }

class _SegmentedButtonDecorationState extends State<SegmentedButtonDecoration> {
  CalendarDecoration calendarView = CalendarDecoration.week;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Selected view: ${calendarView.toString().split('.').last}', style: TextStyle(fontSize: 18)),
        SizedBox(height: 24),
        SegmentedButton<CalendarDecoration>(
          style: SegmentedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.red,
            selectedForegroundColor: Colors.white,
            selectedBackgroundColor: Colors.green,
          ),
          segments: const <ButtonSegment<CalendarDecoration>>[
            ButtonSegment<CalendarDecoration>(
              value: CalendarDecoration.day,
              label: Text('Day'),
              icon: Icon(Icons.calendar_view_day)),
            ButtonSegment<CalendarDecoration>(
              value: CalendarDecoration.week,
              label: Text('Week'),
              icon: Icon(Icons.calendar_view_week)),
            ButtonSegment<CalendarDecoration>(
              value: CalendarDecoration.month,
              label: Text('Month'),
              icon: Icon(Icons.calendar_view_month)),
            ButtonSegment<CalendarDecoration>(
              value: CalendarDecoration.year,
              label: Text('Year'),
              icon: Icon(Icons.calendar_today)),
          ],
          selected: <CalendarDecoration>{calendarView},
          onSelectionChanged: (Set<CalendarDecoration> newSelection) {
            setState(() {
              // By default there is only a single segment that can be
              // selected at one time, so its value is always the first
              // item in the selected set.
              calendarView = newSelection.first;
            });
          },
        ),
      ],
    );
  }
}