import 'package:flutter/material.dart';

class HowToUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How To Use ?'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 200.0,
            height: 100.0,
          ),
          SizedBox(
            width: 50.0,
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'In this application, you need to select a photo from library. There are a lot of templates.',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 22.5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'After you select the photo, press start to think button. If you think this is enough, then press the end thinking button. After color prediction has came, then touch the are you want to paint',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 22.5)),
          ),
        ],
      ),
    );
  }
}
