import 'package:flutter/material.dart';

import 'painting_screen.dart';

class SelectModal extends StatefulWidget {
  late String b;
  SelectModal(String a) {
    this.b = a;
  }

  @override
  State<SelectModal> createState() => _SelectModalState(b);
}

class _SelectModalState extends State<SelectModal> {
  String a = 'a';
  _SelectModalState(String b) {
    a = b;
  }

  List<String> modal_items = [
    'Modal 1',
    'Modal 2',
    'Modal 3',
    'Modal 4',
    'Modal 5',
    'Modal 6',
    'Modal 7',
    'Modal 8',
    'Modal 9'
  ];

  List<String> epoch_values = ['50', '500', '1000'];

  String modal_value = 'Modal 1';
  String epoch_value = '50';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 300,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(children: [
              SizedBox(
                height: 120,
              ),
              Text('Select model number and epoch value'),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 240,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(width: 3, color: Colors.red))),
                    value: modal_value,
                    items: modal_items
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(fontSize: 24),
                            )))
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        modal_value = item!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 240,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(width: 3, color: Colors.red))),
                    value: epoch_value,
                    items: epoch_values
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(fontSize: 24),
                            )))
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        epoch_value = item!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  _navigateToPaintingPage(context, a, modal_value, epoch_value);
                },
                child: Text(
                  'GO TO PAINTING',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

void _navigateToPaintingPage(
    BuildContext context, String a, String modal_value, epoch_value) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PaintingScreen(a, modal_value, epoch_value)));
}
