import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hypergaragesale/components/error_notification.dart';
import 'package:hypergaragesale/components/post_data.dart';
import 'package:hypergaragesale/components/rounded_button.dart';
import 'package:hypergaragesale/components/text_card.dart';
import 'package:hypergaragesale/screens/camera_screen.dart';
import 'package:hypergaragesale/screens/item_list_screen.dart';
import 'package:location/location.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class PostScreen extends StatefulWidget {
  static const String id = 'post_screen';
  final String category;
  PostScreen({this.category});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostData newPost = PostData();
  Location userLocation = Location();
  LocationData _locationData;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;

  String url;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    newPost.category = widget.category;
  }

  PostData newPostData = PostData();

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        setState(() {
          loggedInUser = user;
        });
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('books').snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }

  Future<void> _getLocation() async {
    _locationData = await userLocation.getLocation();
  }

  Future<void> _updateAddress() async {
    Coordinates coordinates =
        Coordinates(_locationData.latitude, _locationData.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print('${first.featureName}');
    newPost.address = first.addressLine;
  }

  void uploadImage() async {
    final StorageReference postImageRef =
        FirebaseStorage.instance.ref().child("zm_post_image");

    var timeKey = new DateTime.now();

    for (String image_path in newPost.pictures) {
      final StorageUploadTask uploadTask = postImageRef
          .child(timeKey.toString() + ".jpg")
          .putFile(File(image_path));

      newPost.pictures.add(image_path);

      var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      setState(() {
        url = ImageUrl;
      });
      print("Image url = " + url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
        title: Text(' New  Post'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                TextCard(
                    label: 'Title',
                    textIn: (newTitle) {
                      newPost.title = newTitle;
                    }),
                SizedBox(height: 10.0),
                TextCard(
                    label: 'Price',
                    price: true,
                    numberKeyboard: true,
                    textIn: (newPrice) {
                      newPost.price = newPrice;
                    }),
                SizedBox(height: 10.0),
                TextCard(
                    label: 'Description',
                    description: true,
                    textIn: (newDescription) {
                      newPost.description = newDescription;
                    }),
                SizedBox(height: 10.0),
                //Text('${newPost.address} ${newPost.latitude} ${newPost.longtitude}'),
                Container(
                    alignment: Alignment(-1.0, 0.0),
                    height: 70.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.white60),
                    child: Wrap(children: [
                      Text('${newPost.address}',
                          style: TextStyle(fontSize: 16.0)),
                    ])),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.room),
                      heroTag: 'address',
                      onPressed: () async {
                        await _getLocation();
                        await _updateAddress();
                        setState(() {
                          newPost.latitude = _locationData.latitude;
                          newPost.longitude = _locationData.longitude;
                          print(
                              '${newPost.address}, ${newPost.latitude}, ${newPost.longitude}');
                        });
                        //get address function, update the address widget
                      },
                    ),
                    Text('       Add a Picture 👉',
                        style: TextStyle(fontSize: 18.0)),
                    FloatingActionButton(
                      child: Icon(Icons.add_a_photo),
                      heroTag: 'picture',
                      onPressed: () async {
                        if (newPost.pictures.length == 4) {
                          showErrorNotification(context, 'Maximun 4 Pictures!');
                        } else {
                          final cameras = await availableCameras();
                          final camera = cameras.first;
                          if (cameras == null || cameras.length == 0) {
                            print('No Camera!!!!');
                          }
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CameraScreen(camera: camera),
                            ),
                          );
                          print(result);
                          setState(() {
                            newPost.pictures.add(result);
                          });
                        }
                        //there is no camera on Simulator, cameras will be null，use NamedRoute instead
                        //Navigator.pushNamed(context, CameraScreen.id);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Container(
                  height: newPost.pictures.length == 0 ? 0.0 : 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PictureThumbnail(newPost: newPost, pictureNumber: 0),
                      PictureThumbnail(newPost: newPost, pictureNumber: 1),
                      PictureThumbnail(newPost: newPost, pictureNumber: 2),
                      PictureThumbnail(newPost: newPost, pictureNumber: 3),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                RoundedButton(
                    title: 'Post',
                    color: Colors.lightBlueAccent,
                    width: 120,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemListScreen(
                            category: widget.category,
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PictureThumbnail extends StatelessWidget {
  PictureThumbnail({@required this.newPost, @required this.pictureNumber});
  final PostData newPost;
  final int pictureNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: newPost.pictures.length <= pictureNumber
          ? null
          : Image.file(File(newPost.pictures[pictureNumber])),
    );
  }
}
