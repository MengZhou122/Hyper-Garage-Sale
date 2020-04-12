import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypergaragesale/components/error_notification.dart';
import 'package:hypergaragesale/components/icon_content.dart';
import 'package:hypergaragesale/components/reusable_card.dart';
import 'package:hypergaragesale/components/rounded_button.dart';
import 'package:hypergaragesale/screens/item_list_screen.dart';
import 'package:hypergaragesale/screens/post_screen.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = 'category_screen';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String selectedCategory = 'unselected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.lightBlueAccent,
        title: Text('  Category'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    ReusableCard(
                      choose: selectedCategory == 'electronics',
                      childIcon: IconContent(
                          icon: FontAwesomeIcons.laptop, label: 'Electronics'),
                      onPress: () {
                        setState(() {
                          selectedCategory = 'electronics';
                        });
                      },
                    ),
                    ReusableCard(
                      choose: selectedCategory == 'tools',
                      childIcon: IconContent(
                          icon: FontAwesomeIcons.tools, label: 'Tools'),
                      onPress: () {
                        setState(() {
                          selectedCategory = 'tools';
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    ReusableCard(
                      choose: selectedCategory == 'clothes',
                      childIcon: IconContent(
                          icon: FontAwesomeIcons.tshirt, label: 'Clothes'),
                      onPress: () {
                        setState(() {
                          selectedCategory = 'clothes';
                        });
                      },
                    ),
                    ReusableCard(
                      choose: selectedCategory == 'books',
                      childIcon: IconContent(
                          icon: FontAwesomeIcons.book, label: 'Books'),
                      onPress: () {
                        setState(() {
                          selectedCategory = 'books';
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    ReusableCard(
                      choose: selectedCategory == 'furnitures',
                      childIcon: IconContent(
                          icon: FontAwesomeIcons.couch, label: 'Furnitures'),
                      onPress: () {
                        setState(() {
                          selectedCategory = 'furnitures';
                        });
                      },
                    ),
                    ReusableCard(
                      choose: selectedCategory == 'toys',
                      childIcon: IconContent(
                          icon: FontAwesomeIcons.plane, label: 'Toys'),
                      onPress: () {
                        setState(() {
                          selectedCategory = 'toys';
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Go Treasure Hunt',
                onPressed: () {
                  if (selectedCategory == 'unselected') {
                    showErrorNotification(context, 'Please Select a Category!');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ItemListScreen(category: selectedCategory),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 5.0),
              RoundedButton(
                color: Colors.blueAccent,
                title: 'Make a New Post',
                onPressed: () {
                  if (selectedCategory == 'unselected') {
                    showErrorNotification(context, 'Please Select a Category!');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PostScreen(category: selectedCategory),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
