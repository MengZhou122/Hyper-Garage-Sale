import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, dynamic> infoList;

  ItemDetailScreen({this.infoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(infoList['user']),
            Text(infoList['title']),
            Text(infoList['price']),
            Text(
                infoList['description'] == null ? '' : infoList['description']),
            //Text(infoList['address']),
          ],
        ),
      ),
    );
  }
}
