import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypergaragesale/components/icon_content.dart';
import 'package:hypergaragesale/components/reusable_card.dart';
import 'package:hypergaragesale/components/rounded_button.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = 'category_screen';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 1,
                        childCard: IconContent(
                            icon: FontAwesomeIcons.laptop,
                            label: '3C Products'),
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
                        childCard: IconContent(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 3,
                        childCard: IconContent(
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
                        childCard: IconContent(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        choose: selectItem == 5,
                        childCard: IconContent(
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
                        childCard: IconContent(
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
                title: 'Go treture hunt',
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
