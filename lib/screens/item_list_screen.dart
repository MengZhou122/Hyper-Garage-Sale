import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hypergaragesale/screens/item_detail_screen.dart';

import 'category_screen.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class ItemListScreen extends StatefulWidget {
  static const String id = 'item__list_screen';
  final String category;

  ItemListScreen({this.category = 'books'});

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final _auth = FirebaseAuth.instance;
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
        title: Text('Items List'),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(CategoryScreen.id));
              }),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ItemStream(collection: widget.category),
          ],
        ),
      ),
    );
  }
}

class ItemStream extends StatelessWidget {
  final String collection;
  ItemStream({this.collection});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection(collection).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final items = snapshot.data.documents;
          List<ItemBubble> ItemBubbles = [];
          for (var item in items) {
            final map = item.data;
            final itemBubble = ItemBubble(
              map: map,
            );
            ItemBubbles.add(itemBubble);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: ItemBubbles,
            ),
          );
        });
  }
}

class ItemBubble extends StatelessWidget {
  final Map<String, dynamic> map;
  ItemBubble({this.map});

  @override
  Widget build(BuildContext context) {
    bool isMe = loggedInUser.email == this.map['user'];
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemDetailScreen(
                infoList: this.map,
              ),
            ),
          );
        },
        child: Container(
          color: isMe ? Colors.lightBlueAccent.shade200 : Colors.grey.shade300,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Wrap(children: [
            Text(
              '【${map['title']}】for \$${map['price']}',
              style: TextStyle(
                  fontSize: 20.0, color: isMe ? Colors.white : Colors.black87),
            )
          ]),
        ),
      ),
    );
  }
}
