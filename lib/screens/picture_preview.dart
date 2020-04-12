import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hypergaragesale/components/rounded_button.dart';
import 'package:hypergaragesale/screens/camera_screen.dart';

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
          //Expanded(child: Image.assert('images/logo'))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RoundedButton(
                title: 'Retake',
                color: Colors.lightBlueAccent,
                width: 100.0,
                onPressed: () async {
                  final cameras = await availableCameras();
                  final camera = cameras.first;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen(camera: camera),
                    ),
                  );
                },
              ),
              RoundedButton(
                title: 'Use It',
                width: 100,
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pop(context, imagePath); //zhong
//                    Navigator.of(context)
//                        .popUntil(ModalRoute.withName(PostScreen.id));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
