import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hypergaragesale/components/rounded_button.dart';

class PicturePreviewScreen extends StatelessWidget {
  static String id = "picture";
  final String imagePath;

  const PicturePreviewScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.file(File(imagePath)),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RoundedButton(
                title: 'Retake',
                width: 100.0,
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 10.0),
              RoundedButton(
                title: 'Use It',
                width: 100.0,
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pop(context, imagePath);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
