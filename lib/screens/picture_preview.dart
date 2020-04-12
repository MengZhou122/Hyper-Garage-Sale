import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hypergaragesale/components/rounded_button.dart';
import 'package:hypergaragesale/screens/post_screen.dart';

class PicturePreviewScreen extends StatelessWidget {
  static String id = "picture";
  final String imagePath;

  const PicturePreviewScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Image.file(File(imagePath))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  title: 'Retake',
                  color: Colors.lightBlueAccent,
                  width: 100.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RoundedButton(
                  title: 'Use It',
                  width: 100,
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName(PostScreen.id));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
