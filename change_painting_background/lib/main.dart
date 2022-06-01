import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:floodfill_image/floodfill_image.dart';
import 'package:http/http.dart' as http;

import 'how_to_use.dart';
import 'store_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAINTISTIC',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(
        title: 'PAINTISTIC',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/zyro-image.jpg'),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled))
                    return Colors.amber;
                  return null; // Defer to the widget's default.
                }),
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled))
                    return Colors.blue;
                  return null; // Defer to the widget's default.
                }),
              ),
              onPressed: () {
                _navigateToStorePage(context);
              },
              child: Text('Select a Photo From Store'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled))
                    return Colors.red;
                  return null; // Defer to the widget's default.
                }),
                foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled))
                    return Colors.blue;
                  return null; // Defer to the widget's default.
                }),
              ),
              onPressed: () {
                _navigateToHowToUsePage(context);
              },
              child: Text('How To Use ?'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToStorePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StorePage()));
  }

  void _navigateToHowToUsePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HowToUsePage()));
  }
}
