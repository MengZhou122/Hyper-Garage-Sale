import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser loggedInUser;

class ItemListScreen extends StatefulWidget {
  static const String id = 'item__list_screen';

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

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
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Items List'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ItemStream(),
          ],
        ),
      ),
    );
  }
}

class ItemStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ),
        );
      }
      final items = snapshot.data.documents;
      List<ItemBubble> ItemBubbles = [];
//      for (var message in messages) {
//        final itemBubble = ItemBubble(
//            );
//        ItemBubbles.add(ItemBubble);
//      }
      return Expanded(
        child: ListView(
          reverse: true,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: ItemBubbles,
        ),
      );
    });
  }
}

class ItemBubble extends StatelessWidget {
  final String name;
  final String price;
  final String year;
  final bool isMe;

  ItemBubble({this.name, this.year, this.price, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Material(
        color: isMe ? Colors.lightBlueAccent : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text(
            '$year $name ask for \$ $price',
            style: TextStyle(
                fontSize: 18.0, color: isMe ? Colors.white : Colors.black54),
          ),
        ),
      ),
    );
  }
}
