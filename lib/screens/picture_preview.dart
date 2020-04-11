import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PicturePreviewScreen extends StatelessWidget {
  static String id = "picture";
  //final String imagePath;

  //const PicturePreviewScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Image.asset('images/logo.png')),
            //Image.file(File(imagePath)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTheme(
                  height: 45.0,
                  child: RaisedButton(
                    elevation: 5.0,
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.lightBlueAccent),
                    ),
                    onPressed: () async {
                      final cameras = await availableCameras();
                      final firstCamera = cameras.first;
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) =>
//                              CameraScreen(camera: firstCamera),
//                        ),
//                      );
                    },
                    textColor: Colors.white,
                    child: Text(
                      'Retake a pciture',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                ButtonTheme(
                  height: 45.0,
                  child: RaisedButton(
                    elevation: 5.0,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    textColor: Colors.white,
                    child: Text(
                      'Use this pciture',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
