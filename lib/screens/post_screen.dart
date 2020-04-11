import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hypergaragesale/components/post_data.dart';
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
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
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
    print("${first.featureName} : ${first.addressLine}");
    newPost.address = first.addressLine;
  }

  void uploadImage() async {
    final StorageReference postImageRef =
        FirebaseStorage.instance.ref().child("Post Images");

    var timeKey = new DateTime.now();

    final StorageUploadTask uploadTask = postImageRef
        .child(timeKey.toString() + ".jpg")
        .putFile(File(newPost.picture1));

    var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    setState(() {
      url = ImageUrl;
    });
    print("Image url = " + url);
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
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextCard(
                    label: 'Name',
                    textIn: (newName) {
                      newPost.name = newName;
                    }),
                SizedBox(height: 10.0),
                TextCard(
                  label: 'Brand',
                  textIn: (newBrand) {
                    newPost.brand = newBrand;
                  },
                ),
                SizedBox(height: 10.0),
                TextCard(
                    label: 'Year',
                    textIn: (newYear) {
                      newPost.name = newYear;
                    }),
                SizedBox(height: 10.0),
                TextCard(
                    label: 'Price',
                    price: true,
                    textIn: (newPrice) {
                      newPost.name = newPrice;
                    }),
                SizedBox(height: 10.0),
                TextCard(
                    label: 'Description',
                    description: true,
                    textIn: (newDescription) {
                      newPost.description = newDescription;
                    }),
                SizedBox(height: 10.0),
                Text('${newPost.address} ${newPost.latitude}'),
                SizedBox(height: 10.0),
                TextCard(
                    label: 'Address',
                    description: true,
                    textIn: (newAddress) {
                      newPost.address = newAddress;
                    }),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.room),
                      heroTag: 'address',
                      onPressed: () {
                        _getLocation();
                        _updateAddress();
                        setState(() {
                          newPost.latitude = _locationData.latitude;
                          newPost.longitude = _locationData.longitude;
                          print('${newPost.latitude} : ${newPost.longitude}');
                        });
                        //get address function, update the address widget
                      },
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '👈 Get Address                  ',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          '                Add a Picture 👉',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                    FloatingActionButton(
                      child: Icon(Icons.camera_alt),
                      heroTag: 'picture',
                      onPressed: () {
                        Navigator.pushNamed(context, CameraScreen.id);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: newPost.picture1 == ""
                      ? null
                      : Image.file(
                          File(newPost.picture1),
                          width: 120,
                          height: 120,
                        ),
                ),
                SizedBox(height: 10.0),
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25.0),
                  child: MaterialButton(
                    onPressed: () {
                      //
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemListScreen(
                                    category: widget.category,
                                  )));
                    },
                    minWidth: 120.0,
                    child: Text(
                      'Post',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
