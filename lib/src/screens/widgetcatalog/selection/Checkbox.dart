import 'package:flutter/material.dart';
import 'package:flutterui/src/widgets/textbox.dart';

class CheckboxScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Checkbox Screen'),
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    children: [
                        textBox(
                            'Checkboxes let users select one or more items from a list, or turn an item on or off',
                            inputFontSize: 24,
                        ),
                        textBox(
                            '#',
                            inputFontSize: 24,
                            url: 'https://m3.material.io/components/checkbox/overview',
                        ),
                        Card(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                                child: CheckboxExample(),
                            ),      
                        ),
                        Card(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),                            
                                child: TristateCheckboxExample(),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}

class CheckboxExample extends StatefulWidget {
    const CheckboxExample({super.key});

    @override
    State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
    bool isChecked = false;

    @override
    Widget build(BuildContext context) {
        Color getColor(Set<MaterialState> states) {
            const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
            };
            if (states.any(interactiveStates.contains)) {
                return Colors.blue;
            }
            return Colors.red;
        }

        return Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: (bool? value) {
                setState(() {
                    isChecked = value!;
                });
            },
        );
    }
}

class TristateCheckboxExample extends StatefulWidget {
    const TristateCheckboxExample({super.key});

    @override
    State<TristateCheckboxExample> createState() => _TristateCheckboxExampleState();
}

class _TristateCheckboxExampleState extends State<TristateCheckboxExample> {
    bool? isChecked = true;

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Checkbox(
                    tristate: true,
                    value: isChecked,
                    onChanged: (bool? value) {
                        setState(() {
                            isChecked = value;
                        });
                    },
                ),
                Checkbox(
                    tristate: true,
                    value: isChecked,
                    onChanged: (bool? value) {
                        setState(() {
                            isChecked = value;
                        });
                    },
                ),
                Checkbox(
                    tristate: true,
                    value: isChecked,
                    onChanged: null,
                ),
            ],
        );
    }
}
