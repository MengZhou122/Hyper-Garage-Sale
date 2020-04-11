import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hypergaragesale/screens/picture_preview.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  static String id = 'camera_screen';

//  final CameraDescription camera;
//
//  const CameraScreen({
//    Key key,
//    this.camera,
//  }) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  String image_path;
  CameraDescription camera;

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  Future<void> getCamera() async {
    final cameras = await availableCameras();
    print(cameras.length);
    camera = cameras.first;
    if (camera == null) {
      print('not first camera found');
    } else {
      print('Yeah, first camera found');
    }
  }

  @override
  Future<void> initState() {
    super.initState();
    getCamera();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Take a Picture'),
          backgroundColor: Colors.lightBlueAccent),
      // Wait until the controller is initialized before displaying the camera preview.
      // Use a FutureBuilder to display spinner until finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Construct the path where the image should be saved using the
            // pattern package.
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture(path);
            Navigator.pushNamed(context, PicturePreviewScreen.id);
//            final res =
////                await Navigator.pushNamed(context, PicturePreviewScreen.id);
            //Navigator.pop(context, res);
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
    );
  }
}
