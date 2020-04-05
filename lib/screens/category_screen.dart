import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypergaragesale/components/icon_content.dart';
import 'package:hypergaragesale/components/reusable_card.dart';
import 'package:hypergaragesale/components/rounded_button.dart';

//final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class CategoryScreen extends StatefulWidget {
  final _auth = FirebaseAuth.instance;

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

  static const String id = 'category_screen';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                widget._auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Category'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 1,
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.laptop,
                            label: 'Electronics'),
                        onPress: () {
                          setState(() {
                            selectItem = 1;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 2,
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.tools, label: 'Tools'),
                        onPress: () {
                          setState(() {
                            selectItem = 2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 3,
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.tshirt, label: 'Clothes'),
                        onPress: () {
                          setState(() {
                            selectItem = 3;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 4,
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.book, label: 'Books'),
                        onPress: () {
                          setState(() {
                            selectItem = 4;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 5,
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.couch, label: 'Furnitures'),
                        onPress: () {
                          setState(() {
                            selectItem = 5;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 6,
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.plane, label: 'Toys'),
                        onPress: () {
                          setState(() {
                            selectItem = 6;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Go treasure hunt',
                onPressed: () {
                  //Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              RoundedButton(
                color: Colors.blueAccent,
                title: 'Make a new post',
                onPressed: () {
                  //Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
