import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        choose: selectedCategory == 'electronics',
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.laptop,
                            label: 'Electronics'),
                        onPress: () {
                          setState(() {
                            selectedCategory = 'electronics';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        choose: selectedCategory == 'tools',
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.tools, label: 'Tools'),
                        onPress: () {
                          setState(() {
                            selectedCategory = 'tools';
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
                        choose: selectedCategory == 'clothes',
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.tshirt, label: 'Clothes'),
                        onPress: () {
                          setState(() {
                            selectedCategory = 'clothes';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        choose: selectedCategory == 'books',
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.book, label: 'Books'),
                        onPress: () {
                          setState(() {
                            selectedCategory = 'books';
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
                        choose: selectedCategory == 'furnitures',
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.couch, label: 'Furnitures'),
                        onPress: () {
                          setState(() {
                            selectedCategory = 'furnitures';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        choose: selectedCategory == 'toys',
                        childIcon: IconContent(
                            icon: FontAwesomeIcons.plane, label: 'Toys'),
                        onPress: () {
                          setState(() {
                            selectedCategory = 'toys';
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
                  if (selectedCategory == 'unselected') {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SingleChildScrollView(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Select a catagory first!',
                                    style: TextStyle(fontSize: 22.0),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  FlatButton(
                                    color: Colors.lightBlueAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0))),
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ));
                  } else {
                    Navigator.pushNamed(context, ItemListScreen.id);
                    //TODO: need to add category info (seletedItem) in to the ItemListScreen builder
                  }
                },
              ),
              RoundedButton(
                color: Colors.blueAccent,
                title: 'Make a new post',
                onPressed: () {
                  if (selectedCategory == 'unselected') {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Select a catagory first!',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            FlatButton(
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(context, _createRoute());
                    //TODO: need to add catagory info into the PostScreen builber
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

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PostScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
