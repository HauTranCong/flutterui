import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class ChipScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Chip Screen'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: [
                        textBox(
                            'Chips help people enter information, make selections, filter content, or trigger actions',
                            inputFontSize: 24,
                        ),
                        textBox(
                            '#',
                            inputFontSize: 24,
                            url: 'https://m3.material.io/components/chips/overview',
                        ),
                        Card(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            'Assist Chip Examples:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        SizedBox(height: 8),
                                        ChipExample(),
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
                                            'Select Chip Example:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        SizedBox(height: 8),
                                        SelectChipExample(),
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
                                            'Suggestion Chip Example:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        SizedBox(height: 8),
                                        SuggestionChipExample(),
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
                                            'Input Chip Example:',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        SizedBox(height: 8),
                                        InputChipExample(),
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

class ChipExample extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: <Widget>[
                Chip(
                    avatar: CircleAvatar(
                        child: Text('W'),
                    ),
                    label: Text('What are you doing?'),
                ),
                Chip(
                    avatar: CircleAvatar(
                        child: Text('W'),
                    ),
                    label: Text('When are you going?'),
                ),
                Chip(
                    avatar: CircleAvatar(
                        child: Text('H'),
                    ),
                    label: Text('How are you doing?'),
                ),
                Chip(
                    avatar: CircleAvatar(
                        child: Text('D'),
                    ),
                    label: Text('Did you reget it?'),
                ),
            ],
        );
    }
}

class SelectChipExample extends StatefulWidget {
    @override
    _SelectChipExampleState createState() => _SelectChipExampleState();
}

class _SelectChipExampleState extends State<SelectChipExample> {
    List<String> _options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
    String _selectedOption = 'Option 1';

    @override
    Widget build(BuildContext context) {
        return Wrap(
            spacing: 8.0,
            children: _options.map((option) {
                return ChoiceChip(
                    label: Text(option),
                    selected: _selectedOption == option,
                    onSelected: (bool selected) {
                        setState(() {
                            _selectedOption = selected ? option : _selectedOption;
                        });
                    },
                );
            }).toList(),
        );
    }
}

class SuggestionChipExample extends StatefulWidget {
    @override
    _SuggestionChipExampleState createState() => _SuggestionChipExampleState();
}

class _SuggestionChipExampleState extends State<SuggestionChipExample> {
    final List<String> _suggestions = ['Suggestion 1', 'Suggestion 2', 'Suggestion 3'];
    final List<String> _selectedSuggestions = [];

    @override
    Widget build(BuildContext context) {
        return Wrap(
            spacing: 8.0,
            children: _suggestions.map((suggestion) {
                return FilterChip(
                    label: Text(suggestion),
                    selected: _selectedSuggestions.contains(suggestion),
                    onSelected: (bool selected) {
                        setState(() {
                            if (selected) {
                                _selectedSuggestions.add(suggestion);
                            } else {
                                _selectedSuggestions.remove(suggestion);
                            }
                        });
                    },
                );
            }).toList(),
        );
    }
}

class InputChipExample extends StatefulWidget {
    @override
    _InputChipExampleState createState() => _InputChipExampleState();
}

class _InputChipExampleState extends State<InputChipExample> {
    final List<String> _chips = ['Apple', 'Banana', 'Cherry'];
    final TextEditingController _controller = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Wrap(
                    spacing: 8.0,
                    children: _chips.map((chip) {
                        return InputChip(
                            label: Text(chip),
                            onDeleted: () {
                                setState(() {
                                    _chips.remove(chip);
                                });
                            },
                        );
                    }).toList(),
                ),
                TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: 'Add a chip',
                    ),
                    onSubmitted: (value) {
                        setState(() {
                            _chips.add(value);
                            _controller.clear();
                        });
                    },
                ),
            ],
        );
    }
}