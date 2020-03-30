import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypergaragesale/components/constants.dart';
import 'package:hypergaragesale/components/icon_content.dart';
import 'package:hypergaragesale/components/reusable_card.dart';
import 'package:hypergaragesale/components/rounded_button.dart';

enum Category { Electronics, Cloth, Furniture, Tool, Book, Toy }

class CategoryScreen extends StatefulWidget {
  static const String id = 'category_screen';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                        color: kInactiveCardColor,
                        childCard: IconContent(
                            icon: FontAwesomeIcons.laptop,
                            label: '3C Products'),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kInactiveCardColor,
                        childCard: IconContent(
                            icon: FontAwesomeIcons.tools, label: 'Tools'),
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
                        color: kInactiveCardColor,
                        childCard: IconContent(
                            icon: FontAwesomeIcons.tshirt, label: 'Clothes'),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kInactiveCardColor,
                        childCard: IconContent(
                            icon: FontAwesomeIcons.book, label: 'Books'),
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
                        color: kInactiveCardColor,
                        childCard: IconContent(
                            icon: FontAwesomeIcons.couch, label: 'Furnitures'),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kInactiveCardColor,
                        childCard: IconContent(
                            icon: FontAwesomeIcons.plane, label: 'Toys'),
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
