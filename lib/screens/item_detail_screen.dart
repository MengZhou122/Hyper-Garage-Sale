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
        minimum: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(infoList['user']),
            Text(infoList['title']),
            Text(infoList['price']),
            Text(
                infoList['description'] == null ? '' : infoList['description']),
            Text(infoList['address'] == null ? '' : infoList['address']),
            Text(infoList['longitude'] == null ? '' : infoList['longitude']),
            Text(infoList['latitude'] == null ? '' : infoList['latitude']),
            //Text(infoList['address']),
          ],
        ),
      ),
    );
  }
}
