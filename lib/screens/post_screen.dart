import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypergaragesale/components/post_data.dart';
import 'package:hypergaragesale/components/text_card.dart';
import 'package:hypergaragesale/screens/camera_screen.dart';
import 'package:hypergaragesale/screens/item_list_screen.dart';
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
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;

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
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
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
                      child: Icon(FontAwesomeIcons.mapMarkerAlt),
                      onPressed: () {
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
                      child: Icon(FontAwesomeIcons.camera),
                      onPressed: () {
                        Navigator.pushNamed(context, CameraScreen.id);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(25.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ItemListScreen.id);
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
