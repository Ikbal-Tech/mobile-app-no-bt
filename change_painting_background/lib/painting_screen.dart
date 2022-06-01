import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:floodfill_image/floodfill_image.dart';
import 'package:http/http.dart' as http;

class PaintingScreen extends StatefulWidget {
  late String b = 'b';
  late String modal = 'Modal 1';
  late String epoch = '500';
  PaintingScreen(String a, String modal, String epoch) {
    this.b = a;
    this.modal = modal;
    this.epoch = epoch;
  }

  @override
  State<PaintingScreen> createState() => _PaintingScreenState(b, modal, epoch);
}

class _PaintingScreenState extends State<PaintingScreen> {
  String file_inner = 'b';
  String modal = 'Model 1';
  String epoch = '500';

  _PaintingScreenState(String b, String modal, String epoch) {
    this.file_inner = b;
    this.modal = modal;
    this.epoch = epoch;
  }

  bool think_enabled = false;
  bool paintable = false;
  Color _fillColor = Colors.cyan;
  int counter_fill = 0;

  List<String> thoughts = List<String>.empty(growable: true);
  List array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  String secret_key = "key"; //Muhammed den alıcaz

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAINTING"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              FloodFillImage(
                imageProvider: AssetImage(file_inner),
                fillColor: _fillColor,
                avoidColor: [Colors.transparent, Colors.black],
                tolerance: 10,
                width: 350,
                height: 350,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: !think_enabled,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            think_enabled = true;
                            paintable = false;
                          });
                        },
                        child: Text(
                          'Start to think',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: think_enabled && !paintable,
                child: TextButton(
                  child: Text(
                    'End thinking',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Waiting for response...'),
                            content: SingleChildScrollView(
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.black,
                                valueColor: AlwaysStoppedAnimation(Colors.red),
                              ),
                            ),
                          );
                        });
                    await Future.delayed(new Duration(seconds: 2));
                    Navigator.pop(context);
                    setState(() {
                      paintable = true;
                      think_enabled = false;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Visibility(
                visible: paintable,
                child: Text(
                  'Tap an area to paint',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void trial_post() async {
    var body = jsonEncode({"name": "Ikbaltech"});

    /*var response = await http.get(
      Uri.parse(
          'https://ikbal-tech-func-color-classifier.azurewebsites.net/api/anon-test?name=Ikbaltech'),
    );*/

    var response = await http.post(
        Uri.parse(
            'https://ikbal-tech-func-color-classifier.azurewebsites.net/api/anon-test'),
        body: body);

    print(response.body);
  }

  void send_data_to_azure() async {}

/*
  void send_data_to_azure() {
    //send to firebase, but parse it first

    for (int i = 0; i < thoughts.length; i++) {
      var arr = thoughts[i].split('-');
      for (int k = 0; k < 15; k++) {
        array[k] = int.parse(arr[k]);
      }
      String? key = ref.child('FIRST TRY').push().key;

      //secret key -> header
      //veriler i body olarak yolluyoruz

      ref.child('FIRST TRY').child(key!).set({
        'N1': array[0],
        'N1': array[0],
        'N2': array[1],
        'N3': array[2],
        'N4': array[3],
        'N5': array[4],
        'N6': array[5],
        'N7': array[6],
        'N8': array[7],
        'N9': array[8],
        'N10': array[9],
        'N11': array[10],
        'N12': array[11],
        'N13': array[12],
        'N14': array[13],
        'N15': array[14],
      });
    }

    thoughts.clear();
  }
  */
}
