import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, dynamic> infoList;

  ItemDetailScreen({this.infoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items Info'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(infoList['user']),
            Text(infoList['title']),
            Text(infoList['price']),
            Text(infoList['description']),
            Text(infoList['address']),
            Text(infoList['longitude']),
            Text(infoList['latitude']),
            Text(infoList['picture0']),
            Text(infoList['picture1']),
            Text(infoList['picture2']),
            Text(infoList['picture3']),
            //Text(infoList['address']),
          ],
        ),
      ),
    );
  }
}
