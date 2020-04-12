import 'package:flutter/material.dart';

void showErrorNotification(context, String title) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => SingleChildScrollView(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 22.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            color: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: Text(
              'OK',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}
