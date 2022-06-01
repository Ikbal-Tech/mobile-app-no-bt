import 'package:change_painting_background/select_modal.dart';
import 'package:flutter/material.dart';

import 'painting_screen.dart';

class StorePage extends StatelessWidget {
  List a = ["assets/kopek.png", "assets/at.png", "assets/peng.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selecting From Store'), centerTitle: true),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Card(
              shape: Border.all(
                width: 5,
              ),
              elevation: 20,
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Image.asset(a[index]),
                  SizedBox(
                    height: 10,
                  ),
                  new IconButton(
                    icon: new Icon(Icons.favorite),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {
                      _navigateToSelectModalPage(context, a[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: a.length,
      ),
    );
  }

  void _navigateToSelectModalPage(BuildContext context, String a) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SelectModal(a)));
  }
}
